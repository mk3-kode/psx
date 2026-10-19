# Mortal Kombat 3 - PlayStation source

The source code of the US PlayStation release of Mortal Kombat 3
(Williams Entertainment / Midway, 1995; SCUS-94201), reconstructed and matched
so that it rebuilds the retail disc byte for byte: MK3.EXE and every
overlay, written into the retail disc's layout.

This repository holds exactly the files the build reads, plus documentation:
no game data, no SDK, no tool binaries. The build takes everything that is not
source from your own retail disc. See **[BUILDING.md](BUILDING.md)** for the
tools and the steps.

```
python -I build.py "<folder with Mortal Kombat 3 (USA) (Track 01..62).bin>"     (Windows)
python3 -I build.py "<folder with Mortal Kombat 3 (USA) (Track 01..62).bin>"    (Linux, macOS)
```

The folder must hold the 62 uncompressed `.bin` tracks; an archive or a
compressed image of the disc (`.7z`, `.zip`, `.chd`, ...) will not work.

## What is here

| Folder | Contents |
|---|---|
| `KODE\` | The game: the 60 C modules and their headers, the 10 assembly sources the build assembles, `MK3.LNK` (link script), `MAKEFILE.MAK` (the build reads its module list and per-file options), `PSXCDABS.C/H` (the CD sector table). |
| `KODE\PALSRC\` | The two NTSC palettes `MKPALNTS.S` includes. |
| `KODE\WESSLIB\` | The WESS sound driver (Williams Entertainment Sound System). |
| `KODE\ARTDATA\` | Assembly sources of the 33 art-data objects: their symbols, pointers and layout, with the art bytes loaded (`incbin`) from the retail disc's files. |
| `_MERGE\SOURCEONLY\SKELETONS\` | The skeleton of the Sony library object; `build.py` fills it from the retail disc. |
| `_MERGE\DOSBOX.CONF` | The DOSBox-X configuration the build runs Psy-Q in. |
| `build.py` | The whole build. |

## Status

- The disc image is identical to the retail disc, track 1 and all 61 audio
  tracks.

## Licensing

Mortal Kombat 3 is © Midway / Williams Entertainment. This repository does not
contain the game's data, its CD audio, Sony's SDK or libraries, or third-party
tools.
