r"""Build Mortal Kombat 3 (PlayStation) from source - see BUILDING.md.

Usage (from this folder):  python3 -I build.py <retail disc dir>   (Windows: python)
Output: OUT/MK3 REBUILD.cue and its 62 tracks."""
import json, os, re, shutil, struct, subprocess, sys

ROOT = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.join(ROOT, "KODE")
TMP = os.path.join(ROOT, "TMP")
OUT = os.path.join(ROOT, "OUT")
SKEL = os.path.join(ROOT, "_MERGE", "SOURCEONLY", "SKELETONS")
DISC = sys.argv[1]
TRACK = "Mortal Kombat 3 (USA) (Track {:02d}).bin"
BS = "\\"


def default_dosbox():
    if sys.platform == "win32":
        return r"C:\DOSBox-X\dosbox-x.exe"
    app = "/Applications/dosbox-x.app/Contents/MacOS/dosbox-x"
    if sys.platform == "darwin" and os.path.exists(app):
        return app
    return shutil.which("dosbox-x") or "dosbox-x"


DOSBOX = os.environ.get("MK3_DOSBOX") or default_dosbox()
# cc1 is a 32-bit x86 Linux program: run directly on Linux, through WSL on
# Windows, in a linux/386 container on macOS (Docker or Podman)
RUNNER = os.environ.get("MK3_CC1_RUNNER") or {"win32": "wsl", "darwin": "docker"}.get(sys.platform, "native")
WSL = os.environ.get("GCC263_WSL", "Ubuntu")
DOCKER = os.environ.get("MK3_DOCKER", "docker")


def ci(path):
    """PATH as it exists on disk, found without regard to case: the DOS tools
    create their files in upper case, which matters on case-sensitive systems."""
    if os.path.exists(path):
        return path
    head, tail = os.path.split(path)
    head = ci(head)
    if os.path.isdir(head):
        for n in os.listdir(head):
            if n.lower() == tail.lower():
                return os.path.join(head, n)
    return os.path.join(head, tail)


def dos(lines):
    with open(os.path.join(TMP, "BUILD.BAT"), "w", newline="\r\n") as fh:
        fh.write("\n".join(["@echo off"] + lines) + "\n")
    env = dict(os.environ)
    if sys.platform.startswith("linux") and not (env.get("DISPLAY") or env.get("WAYLAND_DISPLAY")):
        env.update(SDL_VIDEODRIVER="dummy", SDL_AUDIODRIVER="dummy")      # no display: run without a window
    subprocess.run([DOSBOX, "-conf", os.path.join(ROOT, "_MERGE", "DOSBOX.CONF"), "-silent", "-exit", "-nomenu",
                    "-c", f"call c:{BS}tmp{BS}build.bat"], cwd=ROOT, check=True, env=env,
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


# ---------------------------------------------------------------- the retail track 1
def iso_files(t):
    """{PATH: (sector, size)} of every file in the ISO 9660 directories."""
    def sector(n):
        t.seek(n * 2352 + 24)
        return t.read(2048)
    out = {}
    def walk(rec, path):
        at, size = struct.unpack_from("<I", rec, 2)[0], struct.unpack_from("<I", rec, 10)[0]
        for s in range((size + 2047) // 2048):
            d, o = sector(at + s), 0
            while o < 2048 and d[o]:
                r = d[o:o + d[o]]
                name = r[33:33 + r[32]]
                if name not in (b"\0", b"\1"):
                    full = (path + "/" if path else "") + name.decode("latin-1").split(";")[0].upper()
                    if r[25] & 2:
                        walk(r, full)
                    else:
                        out[full] = (struct.unpack_from("<I", r, 2)[0], struct.unpack_from("<I", r, 10)[0])
                o += d[o]
    walk(sector(16)[156:190], "")
    return out


def read_file(t, where, name):
    at, size = where[name]
    data = b""
    for i in range((size + 2047) // 2048):
        t.seek((at + i) * 2352 + 24)
        data += t.read(2048)
    return data[:size]


# ---------------------------------------------------------------- skeleton objects
def pstr(b, o):
    return b[o + 1:o + 1 + b[o]], o + 1 + b[o]


def expr(b, o):
    op = b[o]; o += 1
    if op == 0:
        return o + 4
    if op in (2, 4, 6, 0x0C, 0x16):
        return o + 2
    return expr(b, expr(b, o))          # binary operator


def records(b):
    """Code records [(section, file offset, length, section offset)] and the
    section offsets of every 4-byte relocation word of an LNK v2 object."""
    o, cur, recs, size, last, keep = 4, None, [], {}, {}, {}
    while True:
        t = b[o]; o += 1
        if t == 0:
            return recs, keep
        if t == 2:
            n = struct.unpack_from("<H", b, o)[0]; o += 2
            last[cur] = size.get(cur, 0)
            recs.append((cur, o, n, last[cur]))
            size[cur] = last[cur] + n
            o += n
        elif t == 6:
            cur = struct.unpack_from("<H", b, o)[0]; o += 2
        elif t == 8:
            size[cur] = size.get(cur, 0) + struct.unpack_from("<I", b, o)[0]; o += 4
        elif t == 10:
            off = last.get(cur, 0) + struct.unpack_from("<H", b, o + 1)[0]
            keep.setdefault(cur, set()).update(range(off, off + 4))
            o = expr(b, o + 3)
        elif t in (12, 48):
            _, o = pstr(b, o + 8)
        elif t == 14:
            _, o = pstr(b, o + 2)
        elif t == 16:
            _, o = pstr(b, o + 5)
        elif t == 18:
            _, o = pstr(b, o + 6)
        elif t == 20:
            _, o = pstr(b, o + 3)
        elif t == 28:
            _, o = pstr(b, o + 2)
        else:
            o += {30: 3, 46: 1, 32: 6, 34: 3, 36: 4, 38: 8, 40: 2, 74: 10, 76: 10, 78: 10}[t]


def fill_objects(t, where):
    """The Sony library object: its skeleton with the code bytes copied from
    where the linker put them in the retail MK3.EXE (relocation words kept)."""
    cache = {}
    for name, m in json.load(open(os.path.join(SKEL, "skeletons.json"))).items():
        s = bytearray(open(os.path.join(SKEL, name.upper() + ".SKL"), "rb").read())
        recs, keep = records(s)
        for sec, at, n, so in recs:
            if str(sec) in m["sections"]:
                f, base = m["sections"][str(sec)]
                if f not in cache:
                    cache[f] = read_file(t, where, f)
                src = cache[f]
                for i in range(n):
                    if so + i not in keep.get(sec, ()):
                        s[at + i] = src[base + so + i]
        dest = os.path.join(ROOT, *m["dest"].split("/"))
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        open(dest, "wb").write(s)


# ---------------------------------------------------------------- EDC / ECC
EDC = []
for i in range(256):
    e = i
    for _ in range(8):
        e = (e >> 1) ^ (0xD8018001 if e & 1 else 0)
    EDC.append(e)
ECC_F, ECC_B = [0] * 256, [0] * 256
for i in range(256):
    j = (i << 1) ^ (0x11D if i & 0x80 else 0)
    ECC_F[i] = j & 0xFF
    ECC_B[i ^ j & 0xFF] = i


def ecc_pq(sec, major_count, minor_count, major_mult, minor_inc, dest):
    size = major_count * minor_count
    for major in range(major_count):
        index = (major >> 1) * major_mult + (major & 1)
        a = b = 0
        for _ in range(minor_count):
            v = sec[12 + index]
            index += minor_inc
            if index >= size:
                index -= size
            a ^= v; b ^= v; a = ECC_F[a]
        a = ECC_B[ECC_F[a] ^ b]
        sec[dest + major] = a
        sec[dest + major + major_count] = a ^ b


def form1(sector, data):
    """A Mode 2 Form 1 sector with its 2048 data bytes replaced."""
    sec = bytearray(sector)
    sec[24:2072] = data.ljust(2048, b"\0")
    e = 0
    for v in sec[16:2072]:
        e = (e >> 8) ^ EDC[(e ^ v) & 0xFF]
    struct.pack_into("<I", sec, 2072, e)
    hdr = sec[12:16]; sec[12:16] = b"\0\0\0\0"          # mode 2: ECC over a zeroed header
    ecc_pq(sec, 86, 24, 2, 86, 2076)
    ecc_pq(sec, 52, 43, 86, 88, 2076 + 172)
    sec[12:16] = hdr
    return bytes(sec)


# ---------------------------------------------------------------- compile and link
WESS = ["wessapi", "wessarc", "seqload", "psxspu", "psxcmd", "wessseq", "wessapit", "lcdload", "wessapim",
        "seqloadr", "wessglob"]
# the defines ccpsx gives the preprocessor
DEFS = ("-undef -D__GNUC__=2 -D__OPTIMIZE__ -lang-c-c++-comments -Dmips -D__mips__ -D__mips -Dpsx -D__psx__ "
        "-D__psx -D__EXTENSIONS__ -D_MIPSEL -D__CHAR_UNSIGNED__ -D_LANGUAGE_C -DLANGUAGE_C")


def runner_path(p):
    """Path P as cc1 sees it."""
    if RUNNER == "wsl":
        return "/mnt/" + p[0].lower() + p[2:].replace(BS, "/")
    if RUNNER == "docker":
        return "/mk3/" + os.path.relpath(p, ROOT).replace(os.sep, "/")
    return p


def run_cc1_script(script):
    if RUNNER == "wsl":
        cmd = ["wsl", "-d", WSL, "-e", "sh", runner_path(script)]
    elif RUNNER == "docker":
        cmd = [DOCKER, "run", "--rm", "--platform", "linux/386", "-v", f"{ROOT}:/mk3", "docker.io/library/busybox", "sh",
               runner_path(script)]
    else:
        cmd = ["sh", script]
    subprocess.run(cmd, check=True)


def game_modules():
    """[(C module, assembler options)] from MAKEFILE.MAK: its objects with a .c
    source, and the -Wa,sl<N> of the overlay modules (sections l<N>.*)."""
    t = re.sub(r"\\\r?\n", " ", open(os.path.join(CODE, "MAKEFILE.MAK"), encoding="latin-1").read())
    objs = set(o.lower() for o in re.search(r"^OBJS\s*=(.*)$", t, re.M).group(1).split())
    objs |= set(o.lower() for o in re.findall(r"^(obj\\\w+\.o)\s*:", t, re.M | re.I))
    wa = {m.group(1).lower(): " ".join("-" + w[4:] for w in m.group(2).split() if w.lower().startswith("-wa,"))
          for m in re.finditer(r"^obj\\(\w+)\.o\s*:[^\n]*\n[ \t]+(ccpsx[^\n]*)", t, re.M | re.I)}
    files = {f.lower() for f in os.listdir(CODE)}
    return [(b, wa.get(b, "")) for b in sorted({os.path.splitext(o.split(BS)[-1])[0] for o in objs})
            if b + ".c" in files]


def compile_c(mods):
    """Every C file to assembly with gcc 2.6.3 (retail's compiler): cpppsx in
    DOSBox-X, then cc1 (see RUNNER). WESS has no small data (-G0)."""
    c = os.path.join(TMP, "C")
    os.makedirs(c, exist_ok=True)
    jobs = [(b, rf"{BS}KODE", "", "") for b, _ in mods] + [(b, rf"{BS}KODE{BS}WESSLIB", "-I.. ", "-G0") for b in WESS]
    for k in range(0, len(jobs), 40):             # DOSBox runs out of table memory after about 80 runs
        lines = []
        for b, d, inc, _ in jobs[k:k + 40]:
            # options in a response file: DOS command lines stop at 127 characters
            open(os.path.join(c, b + ".rsp"), "w", newline="\r\n").write(f"{DEFS} {inc}-Ic:/psx/include {b}.c "
                                                                         f"c:/tmp/c/{b}.i\n")
            lines += [f"cd {d}", rf"cpppsx @c:{BS}tmp{BS}c{BS}{b}.rsp"]
        dos(lines)
    cc1 = os.path.join(ROOT, "TOOLS", "cc1")
    if sys.platform != "win32":
        os.chmod(cc1, os.stat(cc1).st_mode | 0o111)
    sh = []
    for b, _, _, g in jobs:
        i = ci(os.path.join(c, b + ".i"))
        d = open(i, "rb").read().replace(b"\r\n", b"\n")                        # cc1 crashes on CR
        open(i, "wb").write(d)
        sh.append(f"'{runner_path(cc1)}' -quiet -O2 {g} '{runner_path(i)}' -o '{runner_path(os.path.join(c, b + '.s'))}'"
                  " || exit 1")
    open(os.path.join(c, "CC1.SH"), "w", newline="\n").write("\n".join(sh) + "\n")
    run_cc1_script(os.path.join(c, "CC1.SH"))
    for b, *_ in jobs:
        s = os.path.join(c, b + ".s")
        d = open(s, "rb").read().replace(b"\n", b"\r\n")                        # aspsx needs CR/LF
        open(s, "wb").write(d)


def batch(mods):
    """Assemble the game, the art data and WESS, pack the Sony library, link,
    convert - one DOSBox session per part (the table memory again)."""
    game = [rf"cd {BS}KODE"]
    game += [rf"aspsx {opts} c:{BS}tmp{BS}c{BS}{b}.s -o obj{BS}{b}.o".replace("  ", " ") for b, opts in mods]
    game += [rf"asmpsx /l {b},obj{BS}{b}.o" for b in ["heaparea", "mktextdt", "snmain", "snsizes", "loadaddr", "mkbt",
                                                       "context", "mkstk", "mkscombo", "mkpalnts"]]
    art = [rf"cd {BS}KODE{BS}ARTDATA"] + [rf"asmpsx /l {s[:-2].lower()},c:{BS}kode{BS}obj{BS}{s[:-2].lower()}.o"
                                         for s in sorted(os.listdir(os.path.join(CODE, "ARTDATA")))]
    wess = [rf"cd {BS}KODE{BS}WESSLIB"]
    wess += [rf"c:{BS}tools{BS}aspsx -G0 c:{BS}tmp{BS}c{BS}{b}.s -o obj{BS}{b}.o" for b in WESS]
    wess += [rf"c:{BS}tools{BS}aspsx -G0 wessbss.s -o obj{BS}wessbss.o",
             rf"cd {BS}_MERGE{BS}LIBPATCH{BS}OBJ", "if exist sonylib.lib del sonylib.lib",
             "psylib /a sonylib.lib sonylib.obj",
             rf"cd {BS}KODE", rf"psylink /b /c /o$80010000 @mk3.lnk,c:{BS}tmp{BS}mk3.cpe",
             rf"cd {BS}TMP", rf"c:{BS}tools{BS}cpe2x /CA mk3.cpe"]
    return game, art, wess


def main():
    os.makedirs(TMP, exist_ok=True)
    rtrack = open(os.path.join(DISC, TRACK.format(1)), "rb")
    where = iso_files(rtrack)
    fill_objects(rtrack, where)
    # the retail files the art data sources (KODE\ARTDATA) load bytes from
    art = os.path.join(CODE, "ARTDATA")
    for f in sorted({m.group(1) for s in os.listdir(art) for m in re.finditer(
            r'incbin\s+"c:\\tmp\\retail\\([^"]+)"', open(os.path.join(art, s), encoding="latin-1").read(), re.I)}):
        dest = os.path.join(TMP, "RETAIL", *f.split(BS))
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        open(dest, "wb").write(read_file(rtrack, where, f.replace(BS, "/").upper()))

    mods = game_modules()
    compile_c(mods)

    # psylink writes the overlays into these folders (file("...") in MK3.LNK)
    for d in ("attract", "bios", "bkgds", "endings", "overlay", "vs", "obj", os.path.join("WESSLIB", "OBJ")):
        os.makedirs(os.path.join(CODE, d), exist_ok=True)
    for part in batch(mods):
        dos(part)

    # the retail disc with MK3.EXE and the overlays written over their sectors
    os.makedirs(OUT, exist_ok=True)
    t1 = os.path.join(OUT, "MK3 REBUILD (Track 01).bin")
    shutil.copyfile(os.path.join(DISC, TRACK.format(1)), t1)
    lnk = open(os.path.join(CODE, "MK3.LNK"), encoding="latin-1").read()
    built = {"MK3.EXE": ci(os.path.join(TMP, "MK3.EXE"))}
    for o in re.findall(r'^[^;\n]*file\s*\(\s*"([^"]+)"', lnk, re.M | re.I):
        d, f = os.path.split(o.replace(BS, "/"))
        stem, dot, ext = f.partition(".")
        rel = f"{d}/{stem[:8]}{dot}{ext[:3]}".upper()                     # the DOS 8.3 name
        built[rel] = ci(os.path.join(CODE, *rel.split("/")))
    with open(t1, "r+b") as t:
        for rel, path in built.items():
            data, at = open(path, "rb").read(), where[rel][0]
            for i in range((len(data) + 2047) // 2048):
                t.seek((at + i) * 2352)
                sec = t.read(2352)
                t.seek((at + i) * 2352)
                t.write(form1(sec, data[i * 2048:(i + 1) * 2048]))
    cue = ['FILE "MK3 REBUILD (Track 01).bin" BINARY', "  TRACK 01 MODE2/2352", "    INDEX 01 00:00:00"]
    for n in range(2, 63):
        name = f"MK3 REBUILD (Track {n:02d}).bin"
        shutil.copyfile(os.path.join(DISC, TRACK.format(n)), os.path.join(OUT, name))
        cue += [f'FILE "{name}" BINARY', f"  TRACK {n:02d} AUDIO", "    INDEX 00 00:00:00", "    INDEX 01 00:02:00"]
    open(os.path.join(OUT, "MK3 REBUILD.cue"), "w", newline="\r\n").write("\n".join(cue) + "\n")


main()
