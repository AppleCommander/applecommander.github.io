# Capabilities

AppleCommanderFX differs from AppleCommander, not only in the user interface, but also in the underlaying APIs. 
The ultimate goal is to shift all components over. During transition, this will hopefully help understand some of the 
non-visual differences.

### Disk image organizations

| Description | AppleCommander | AppleCommanderFX |
| :--- | :---: | :---: |
| 13-sector and 16-sector Nibble images (`*.nib`) | Yes | Yes |
| 13-sector DOS-ordered images (`*.d13`) | Yes | Yes |
| 140K DOS-ordered images (`*.do`, `*.dsk`, `*.d16`) | Yes | Yes |
| 140K ProDOS-ordered images (`*.po`) | Yes | Yes |
| 32MB ApplePC Hard Disk images (`*.hdv`) | Yes | Yes |
| Compressed images (`*.gz`) | Yes | Yes |
| Disk Copy Images (`*.dc`) | Yes | Yes |
| Universal Disk Images (`*.2mg`, `*.2img`) | Yes | Yes |
| WOZ Disk Image, version 1 and 2 (`*.woz`) - 5.25" only | Yes | Yes |

### Disk formats

| Description | AppleCommander | AppleCommanderFX |
| :--- | :---: | :---: |
| Apple Pascal (140K and 800K formats) | Read/Write | Read/Write/Format[^3] |
| CP/M (probably only 140K formats) | Read-only | Read-only[^4] |
| DOS (13-sector) | Read-only | Read-only[^4] |
| DOS (16-sector) | Read/Write | Read/Write[^4] |
| GameDOS | N/A | Read/Write/Format[^3] |
| Gutenberg Word Processor | Read-only | Read-only[^4] |
| NakedOS (see the [Super-Mon page](https://bitbucket.org/martin.haye/super-mon/wiki/Home)) | Read-only |  Read-only[^4] |
| ProDOS | Read/Write | Read/Write[^4] |
| SSI's RDOS (140K formats only) | Read-only | Read/Write/Format[^3] |
| UniDOS, OzDOS (800K formats only) | Read/Write | Read/Write[^4] |

### Archive formats

| Description | AppleCommander | AppleCommanderFX |
| :--- | :---: | :---: |
| Apple Archive Format | N/A | Read-only |
| AppleSingle | Import/Export | Import/Export |
| Binary II | Sometimes[^5] | Read-only |
| BinSCII | N/A | Read-only |
| ShrinkIt | Read-only[^1] | Read-only[^2] |
| Zip | N/A | Read/Write/Create |

[^1]: The archive will be automatically extracted into a ProDOS disk.
[^2]: The archive will be handled in it's native format.
[^3]: When format is called out, this implies the the disk is bootable as well.
[^4]: The "legacy" implementations work through a _shim_ that maps the old APIs into the new APIs.
[^5]: If the archive contains a ShrinkIt archive, it will be extracted into a ProDOS disk.