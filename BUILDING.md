# Building Mortal Kombat 3 (PlayStation)

This project builds the US release of Mortal Kombat 3 for the PlayStation
(SCUS-94201) from source. It produces a disc image that is
byte-identical to the retail disc, all 62 tracks.

The repository holds only code, build scripts and documentation. You supply:

1. the tools listed below (none are included);
2. your own dump of the US retail disc. The build takes from it everything
   that is not source: the game's art and sound data, the Sony library code,
   the boot loader, intro movie, CD audio and licence sectors.

## 1. Requirements

The build runs on Windows, Linux and macOS. All paths below are relative to
the project folder; they are written with `\`, which is `/` on Linux and
macOS.

| What | Version | Where it goes |
|---|---|---|
| Windows 10/11, Linux (x86) or macOS | tested: Windows 11, Ubuntu 26.04 | |
| [DOSBox-X](https://dosbox-x.com) | tested: 2026.10.01 (Windows), 2026.01.02 (Ubuntu's `dosbox-x` package) | Windows: `C:\DOSBox-X\dosbox-x.exe`; Linux: `dosbox-x` on `PATH`; macOS: `/Applications/dosbox-x.app` or `dosbox-x` on `PATH`; or set `MK3_DOSBOX` to its path |
| Python | 3.10 or later (tested 3.14) | on `PATH` as `python` (Windows) or `python3` |
| A way to run `cc1`, a 32-bit x86 Linux program (see below) | Windows: WSL (tested: Ubuntu 26.04); Linux: nothing; macOS: Docker or Podman | |
| Psy-Q PlayStation SDK (the files listed below) | Sony PS-X Development System Release 3.0 (April 1994) | `PSX\` |
| CPE2X 1.5 | Runtime Library 3.3 disc (its `PSXGRAPH\BIN\CPE2X.EXE`) | `TOOLS\CPE2X.EXE` |
| ASPSX 2.21 | Runtime Library 3.3 disc (its `PSYQ\ASPSX.EXE`) | `TOOLS\ASPSX.EXE` |
| gcc 2.6.3 `cc1` for the PlayStation, Linux build | decompals/old-gcc release 0.17 | `TOOLS\cc1` |
| US retail disc dump | Redump: "Mortal Kombat 3 (USA)", 62 tracks | any folder |

### Psy-Q SDK (`PSX\`)

The build uses only these SDK files (DOSBox-X mounts the project folder as
`C:`, so it finds them as `C:\PSX\...`; see `_MERGE\DOSBOX.CONF`), and was
verified with exactly these and nothing else in `PSX\`:

| File | Size | sha256 |
|---|---:|---|
| `PSX\BIN\ASMPSX.EXE` (Psy-Q PSX 1.21) | 115072 | `8804da268575232018071e15287124ab8891b3cbf070b2b316c276de6d06b445` |
| `PSX\BIN\ASPSX.EXE` (assembles the game's C code) | 56169 | `e368c1032ee1ea51bb55e55abdffbf7cb86852b89ba72360266c13b4327e2623` |
| `PSX\BIN\PSYLIB.EXE` | 45152 | `fdae3dea7cfd0891a4862e845398a7b028a51cede0d0f0f852d269e8a877bd98` |
| `PSX\BIN\PSYLINK.EXE` | 104861 | `c50518655cd965bfc899098563e34ba7447a43a43cec64bae1104dae4b314bdd` |
| `PSX\COMPILER\CPPPSX.EXE` (the preprocessor) | 232292 | `97b42264dffafcf15ca3e6348d49a537f13d958d2d66292eeb1a1c155fe0c217` |

and these 12 headers in `PSX\INCLUDE` (the files the preprocessor reads for
the 71 C files the build compiles):

| File | Size | sha256 |
|---|---:|---|
| `PSX\INCLUDE\ASM.H` | 2870 | `f99a3d43ad175d3bda14945865d68ccb5d80e9740ff95b634ee0a2f1a6d92afa` |
| `PSX\INCLUDE\KERNEL.H` | 4321 | `9d69bf1b8bde57a376229fe53d17f0eb541c17e05d267e33499adb028d331b26` |
| `PSX\INCLUDE\LIBCD.H` | 7688 | `15a005ba2071fb8bd4571b9c8be49d40ae64a00219388b32bbe47347cb2e5ae2` |
| `PSX\INCLUDE\LIBETC.H` | 1698 | `bd1030fe46589c064eadcf5b56bca904d0a7930646211638c58e3d9c8c1949ad` |
| `PSX\INCLUDE\LIBGPU.H` | 20980 | `1396280d4a5eac383f486c6b9384d73fb64f954160651b90f2bd61129d56ed69` |
| `PSX\INCLUDE\LIBGS.H` | 11830 | `86a6638c8b7ad47e4999ee8722b582d156e99018f3288a7f79c5069bf7908f9e` |
| `PSX\INCLUDE\LIBGTE.H` | 31684 | `5bac11333bed070adb473e4755782ee91f7680e661794b48ce43d970014eaee2` |
| `PSX\INCLUDE\LIBSN.H` | 2148 | `31211374e24e7c20b214b1d8676e48462510e6de0014292b2b8a41682028337b` |
| `PSX\INCLUDE\LIBSPU.H` | 17200 | `2e2bab155f3d314761ce2884b49a1511fd15e079fa01bf54a2a1b5b842c53bef` |
| `PSX\INCLUDE\R3000.H` | 8015 | `eb30e9067f875988de4d03bde393f0cdeec58301c150ac6d06d732977470f8ed` |
| `PSX\INCLUDE\STDIO.H` | 224 | `0cfbf7103e64256ccb3aeae4046a92e55a3eb8dc23196e0a45cb1900ac4a4f45` |
| `PSX\INCLUDE\SYS\TYPES.H` | 1337 | `294a2d59cd6b315589d6fa25f042bea35a8a3e6d52d3e1d261c8942ab8eafa34` |

### The other tools

| File | Size | sha256 |
|---|---:|---|
| `TOOLS\ASPSX.EXE` | 60665 | `b52bf3d40a516333e679f18e9297883158e3015e8d97ac501e108b049617ce41` |
| `TOOLS\cc1` | 2787604 | `f4391c56fe7c602a0287619cfc4c94a3abbea76b2a1d67a23bf15206f6ae50f2` |
| `TOOLS\CPE2X.EXE` | 17720 | `777caca88327cd18d4f92b43439575c1759381690d49f14177805a94b8ecbef6` |

- **CPE2X 1.5** converts the linked `MK3.CPE` into the PS-X EXE. Retail's
  header ("for North America area") is the one version 1.5 writes with `/CA`;
  the older CPE2X in the 3.0 SDK writes the Japanese one.
- **ASPSX 2.21** assembles the WESS sound library (`KODE\WESSLIB`) as retail's
  was assembled (its divide-overflow traps are `break 6`).
- **gcc 2.6.3 `cc1`** compiles every C file, as it compiled retail MK3 (the
  SDK's cc1psx is 2.6.0, whose code differs for `KODE\MKMAIN.C` and
  `KODE\WESSLIB\WESSAPI.C`); the WESS library with `-G0`, since retail's has
  no small data. It is a static 32-bit x86 Linux program, so it needs no
  libraries, only a Linux to run in:
  - **Windows:** WSL, with any distribution (default `Ubuntu`, or set
    `GCC263_WSL`).
  - **Linux:** it runs directly (on x86 Linux; on ARM Linux, use a container as
    on macOS and set `MK3_CC1_RUNNER=docker`).
  - **macOS:** there is no macOS build of gcc 2.6.3, so the build runs `cc1` in a
    `linux/386` container (image `docker.io/library/busybox`) with Docker
    (Docker Desktop, Colima, OrbStack) or Podman (`MK3_DOCKER=podman`). On
    Apple Silicon the container runs under emulation.

  Download `gcc-2.6.3-psx.tar.gz` from
  <https://github.com/decompals/old-gcc/releases/download/0.17/gcc-2.6.3-psx.tar.gz>
  (sha256 `01e6e8c4933414ea3f8d8e3bc766a1f5fafd4fc0110e0b75d1f691bd791989b1`)
  and extract `cc1` from it.

### The retail disc

A raw (2352-byte sector) dump, as Redump lists it: a cue sheet and
`Mortal Kombat 3 (USA) (Track 01).bin` to `(Track 62).bin` in one folder,
with exactly these file names. Track 1 is the data track:

- size 44229360 bytes
- md5 `42e7b6d08a6d0832ba0b0f07ba88558e`
- sha1 `c859c47c957c60de82261c4d5fd184e7cebac957`

Tracks 2-62 are the CD audio.

The build reads these 62 `.bin` files directly, so they must be on disk
uncompressed. A compressed copy of the dump does not work: not an archive of
it (`.7z`, `.zip`, `.rar`), not a compressed disc image (`.chd`, `.ecm`,
`.pbp`, ...), and not a single merged `.bin`. Extract or convert it back to the
62 separate tracks first. The files copied out of the disc (`MK3.EXE`, the
`.BIN` and `.OVL` files) will not work either: the build needs the raw
tracks, since it reads the ISO 9660 directory and writes the image from them.

## 2. Folder layout after setup

```
build.py                    the build
BUILDING.md, README.md
KODE\                       game source (C, assembly, MK3.LNK, MAKEFILE.MAK)
KODE\WESSLIB\               WESS sound library source
KODE\PALSRC\                the two palettes MKPALNTS.S includes
KODE\ARTDATA\               the 33 art-data objects' sources (bytes from your disc)
_MERGE\SOURCEONLY\SKELETONS\ the Sony library's skeleton (filled from your disc)
_MERGE\DOSBOX.CONF          DOSBox-X configuration (Psy-Q environment)
PSX\                        the SDK files listed in section 1       <- you add these
TOOLS\                      ASPSX.EXE, cc1, CPE2X.EXE               <- you add these
```

`PSX\` (with the subfolders the SDK files go in) and `TOOLS\` already exist
in a fresh checkout. Each folder holds a `REQUIRED.TXT` listing the files
that belong in it, with their sizes and sha256s.

Avoid paths that DOS cannot handle inside DOSBox-X's mount (the project
folder itself may have spaces; DOSBox-X mounts it as `C:`).

## 3. Build

From the project folder:

```
python -I build.py "<folder with Mortal Kombat 3 (USA) (Track 01..62).bin>"     (Windows)
python3 -I build.py "<folder with Mortal Kombat 3 (USA) (Track 01..62).bin>"    (Linux, macOS)
```

`build.py` runs these steps and stops at the first failure:

1. **Files from the retail disc.** It reads track 1 directly: it fills the
   Sony library object's skeleton (`_MERGE\SOURCEONLY\SKELETONS`) from
   `MK3.EXE`, and writes the files `KODE\ARTDATA`'s sources load their art
   bytes from (`MK3.EXE` and overlays) to `TMP\RETAIL\`.
2. **Compile.** The 71 C files (60 game, 11 WESS) are preprocessed by cpppsx
   in DOSBox-X and compiled by gcc 2.6.3's `cc1` (through WSL on Windows,
   directly on Linux, in a container on macOS).
3. **Assemble and link** in DOSBox-X: aspsx assembles the game's C code,
   ASPSX 2.21 the WESS library's, asmpsx the 10 assembly files and the 33
   art-data sources; psylib packs `SONYLIB.LIB`; psylink links
   `KODE\MK3.LNK`; CPE2X 1.5 writes `MK3.EXE`.
4. **Disc image.** A copy of your disc's track 1 with `MK3.EXE` and the 72
   overlays written over their sectors (EDC/ECC recomputed), and your disc's
   61 audio tracks.

A full build takes a few minutes. The result is `OUT\MK3 REBUILD.cue` with
its 62 `.bin` tracks. Track 1 has the md5 and sha1 given in section 1; tracks
2-62 are copies of yours.

The compile step prints 9 warnings, each after an `In function` line:

```
mksel.c: In function `p1_select':
mksel.c:612: warning: assignment discards `volatile' from pointer target type
```

They come from `MKGUYS.C`, `MKHSTD.C`, `MKJOY.C`, `MKLADDER.C` and `MKSEL.C`,
where the game's code assigns a pointer to `volatile` data to a plain
pointer. They are expected and harmless: gcc 2.6.3 compiles the code as it
is written, and that is the code retail has. Any other warning or error
message is not part of a normal build.

On Linux without a display (`DISPLAY` and `WAYLAND_DISPLAY` unset) the build
runs DOSBox-X without a window.

Environment variables:
- `MK3_DOSBOX`: the DOSBox-X executable.
- `MK3_CC1_RUNNER`: how `cc1` runs: `wsl`, `native` or `docker` (default:
  `wsl` on Windows, `native` on Linux, `docker` on macOS).
- `GCC263_WSL`: the WSL distribution that runs `cc1` (default `Ubuntu`).
- `MK3_DOCKER`: the container command for `docker` (default `docker`; e.g.
  `podman`).

## 4. Troubleshooting

- **Track 1 differs from retail**: check that the tools match the checksums
  in section 1.
- **`cc1` does not run**: on Windows, check that WSL can run the distribution
  (`wsl -d Ubuntu -e true`); on macOS, that the container engine is running
  (`docker run --rm --platform linux/386 docker.io/library/busybox true`); on
  Linux, that `TOOLS/cc1` is the file from the archive (it is made executable
  by the build).
- **DOSBox-X not found**: install it (Linux: your distribution's `dosbox-x`
  package or the Flatpak; macOS: the app from dosbox-x.com, or
  `brew install --cask dosbox-x`) or set `MK3_DOSBOX`.
- **A `KeyError` naming a disc file**: the dump is not the US retail disc
  (SCUS-94201). Compare track 1 with the hashes above.
- **Files that suddenly vanish or come back as 0 bytes**: synchronisation
  tools (OneDrive, Dropbox) can interfere with DOSBox-X writing files. Pause
  synchronisation or build outside a synchronised folder.

## 5. What comes from where

| Built from this project's source | Taken from your retail disc |
|---|---|
| MK3.EXE and every code overlay: 60 C files, 43 assembly files | art and sound data files (`*.BIN`, `*.LCD`, `SNDDATA\`) |
| the WESS sound library | the art bytes of the 33 art-data objects (`incbin` in `KODE\ARTDATA`) |
| the CD sector table (in MK3.EXE) | the Sony library code (`SONYLIB.OBJ`, via its skeleton) |
| | SCUS_942.01 (boot loader), SYSTEM.CNF, MOVIE.STR, W30.STR |
| | the disc layout and ISO 9660 structures, CD audio tracks 2-62, licence sectors 0-15 |

The art-data sources hold the objects' structure (symbols, pointers,
layout), not the art: each byte range comes from your disc. The Sony
library's skeleton is its object file with the section contents zeroed,
except the 4-byte words at relocation sites.
