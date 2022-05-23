`acx` is a new command-line tool for AppleCommander.  This tool is subcommand based (think `git pull` and `git commit`) and is expected to allow more nuanced command activities.

## Overview / Asking for help

All commands and subcommands will show options and command structure with the `--help` flag. 

```
$ acx --help
Usage: acx [-hVv] [--debug] [--quiet] [COMMAND]

'acx' experimental utility

Options:
      --debug     Show detailed stack traces.
  -h, --help      Show this help message and exit.
      --quiet     Turn off all logging.
  -v, --verbose   Be verbose. Multiple occurrences increase logging.
  -V, --version   Print version information and exit.

Commands:
  compare          Compare two disk images.
  convert          Uncompress a ShrinkIt or Binary II file; or convert a
                     DiskCopy 4.2 image into a ProDOS disk image.
  copy, cp         Copy files between disks.
  create, mkdisk   Create a disk image.
  delete, del, rm  Delete file(s) from a disk image.
  diskmap, map     Show disk usage map.
  dump             Dump a block or sector.
  export, x, get   Export file(s) from a disk image.
  dups             Find duplicate files.
  help             Displays help information about the specified command
  import, put      Import file onto disk.
  info, i          Show information on a disk image(s).
  list, ls         List directory of disk image(s).
  lock             Lock file(s) on a disk image.
  mkdir, md        Create a directory on disk.
  read             Read a block or sector.
  rename, ren      Rename file on a disk image.
  rename-disk      Rename volume of a disk image.
  rmdir, rd        Remove a directory on disk.
  unlock           Unlock file(s) on a disk image.
  write            Write a block or sector.
```

When looking for options for a subcommand, the `help` subcommand may be used as an alternate (`acx copy --help` or `acx help copy` are both valid).

```
$ acx copy --help
Usage: acx copy [-fhr] -d=<disk> -s=<sourceDisk> [--to=<targetPath>]
                [<globs>...]

Copy files between disks.

Parameters:
      [<globs>...]    File glob(s) to copy (default = '*')

Options:
  -d, --disk=<disk>   Image to process [$ACX_DISK_NAME].
  -f, --force         Overwrite existing files.
  -h, --help          Show help for subcommand.
  -r, --recursive     Copy files recursively.
  -s, --from, --source=<sourceDisk>
                      Source disk for files.
      --to, --directory=<targetPath>
                      Specify which directory to place files.
```

## Identifying a disk

`acx` differs from `ac` in that the primary disk image is always specified by the `-d` flag.  However, this can be painful when running a series of commands.  To simplify usage, the environment variable `ACX_DISK_NAME` can be set to simplify scripting.

This means that a sequence of commands that look like this:
```
$ acx create -d disk1.po --prodos
$ acx copy -d disk1.po --from ProDOS_2_4_2.dsk PRODOS BASIC.SYSTEM
$ acx list -d disk1.po --native

File: disk1.po
Name: /NEW.DISK/
* BASIC.SYSTEM    SYS      021 05/23/2022 01/13/2018     10,240 A=$2000  
* PRODOS          SYS      035 05/23/2022 01/13/2018     17,128          
ProDOS format; 111,104 bytes free; 32,256 bytes used.
```

Can also be specified in this manner:
```
$ export ACX_DISK_NAME=disk2.po   # This sets the environment variable with the disk name
$ acx create --prodos
$ acx copy --from ProDOS_2_4_2.dsk PRODOS BASIC.SYSTEM
$ acx list --native

File: disk2.po
Name: /NEW.DISK/
* BASIC.SYSTEM    SYS      021 05/23/2022 01/13/2018     10,240 A=$2000  
* PRODOS          SYS      035 05/23/2022 01/13/2018     17,128          
ProDOS format; 111,104 bytes free; 32,256 bytes used.
$ unset ACX_DISK_NAME               # This removes the environment variable
```

## Creating a bootable disk

`acx` introduces experimenal capability to create bootable disks. Note that this is only viable for writeable disks (DOS, ProDOS, and Pascal).

```
$ acx create -d disk1.po --format ProDOS_2_4_2.dsk --prodos --size=140kb
$ acx create -d disk2.dsk --format original332sysmas.nib --dos --size=140kb
$ acx create -d disk3.po --format UCSD\ Pascal\ 1.2_0.DSK --pascal
```

> Note that Pascal doesn't copy any files. Looking for feedback or PR's to correct this!

For ProDOS and Pascal, the boot block is copied over and in the ProDOS case, `STARTUP` and `BASIC.SYSTEM` as well. For DOS 3.3, tracks 0-2 are copied and marked as used.

## Dumping a block or sector

`acx` can dump any sector or block in a hex format:

```
$ acx dump -d ProDOS_2_4_2.dsk --block 2
Offset   Hex Data                                          Characters
=======  ================================================  =================
$000800  00 00 03 00 FC 50 52 4F  44 4F 53 2E 32 2E 34 2E  ....|PRO DOS.2.4.
$000810  32 00 00 00 00 00 00 00  00 00 00 00 33 21 10 13  2....... ....3!..
$000820  00 00 C3 27 0D 13 00 06  00 18 01 1B 56 49 45 57  ..C'.... ....VIEW
$000830  2E 52 45 41 44 4D 45 00  00 00 00 FC 16 01 01 00  .README. ...|....
$000840  00 02 00 2D 24 09 09 24  00 E3 01 08 2F 21 1A 09  ...-$..$ .c../!..
$000850  02 00 1A 42 49 54 53 59  2E 42 4F 4F 54 00 00 00  ...BITSY .BOOT...
$000860  00 00 FF 3D 00 01 00 6D  01 00 2D 24 09 09 24 00  ...=...m ..-$..$.
$000870  21 00 20 2F 21 31 09 02  00 1B 51 55 49 54 2E 53  !. /!1.. ..QUIT.S
$000880  59 53 54 45 4D 00 00 00  00 FF 27 00 01 00 38 00  YSTEM... ..'...8.
<snip>
```

## Disassembling the boot sector

`acx` can dump any sector or block in a disassembled format:

```
$ acx dump -d ~/Downloads/ProDOS_2_4_2.dsk -t 0 -s 0 --disassembly
0800- 01        ???
0801- 38        SEC
0802- B0 03     BCS $0807
0804- 4C 32 A1  JMP $A132
0807- 86 43     STX $43
0809- C9 03     CMP #$03
080B- 08        PHP
080C- 8A        TXA
080D- 29 70     AND #$70
080F- 4A        LSR
0810- 4A        LSR
0811- 4A        LSR
0812- 4A        LSR
0813- 09 C0     ORA #$C0
0815- 85 49     STA $49
0817- A0 FF     LDY #$FF
0819- 84 48     STY $48
081B- 28        PLP
081C- C8        INY
081D- B1 48     LDA ($48),Y
081F- D0 3A     BNE $085B
0821- B0 0E     BCS $0831
0823- A9 03     LDA #$03
0825- 8D 00 08  STA $0800
<snip>
```

## File listings by name pattern

A new feature when listing files is that `acx` allows "glob" pattern matching ("*" wildcard matching). (Be careful with the usual shell expansion issues.)

For example, to list files that might be run at startup (`*.SYSTEM`):

```
$ acx ls -d ProDOS_2_4_2.dsk --globs "*.SYSTEM"

File: ProDOS_2_4_2.dsk
Name: /PRODOS.2.4.2/
* QUIT.SYSTEM     SYS      001 09/15/2016 01/13/2018         56 A=$2000  
* BASIC.SYSTEM    SYS      021 08/30/2016 01/13/2018     10,240 A=$2000  
* FASTDSK.SYSTEM  SYS      004 05/04/2009 01/13/2018      1,402 A=$2000  
ProDOS format; 0 bytes free; 143,360 bytes used.
```

## File listing as JSON or CSV

Like `ac`, `acx` allows file listings to be written out as structured text.  Specifically, with JSON output, secondary processing tools can be used to extract information. Here's a sample using the `jq` tool:

```
$ acx ls -d ProDOS_2_4_2.dsk --json | jq '.disks[].files[] | select(.name == "BASIC.SYSTEM")'
{
  "locked": "*",
  "name": "BASIC.SYSTEM",
  "type": "SYS",
  "blocks": "021",
  "modified": "08/30/2016",
  "created": "01/13/2018",
  "size": "10,240",
  "auxType": "A=$2000"
}
```

## Find duplicate files

`acx` can look for duplicate files:

```
$ acx dups -d "Beagle Bros Tip Disk #1.dsk"
Differences:
/mmmmmmmm TIP BOOK #1 mmmmmmmmm has the following duplicates:
    - /mmmmmmmm TIP BOOK #2 mmmmmmmmm
    - /mmmmmmmm TIP BOOK #3 mmmmmmmmm
    - /mmmmmmmm TIP BOOK #4 mmmmmmmmm
/TIP DISK #1 has the following duplicates:
    - /D2
```

... and a partial directory listing:

```
$ acx ls -l -d "Beagle Bros Tip Disk #1.dsk"

File: Beagle Bros Tip Disk #1.dsk
Name: DISK VOLUME #254
* A TIP DISK #1                       703 004         T19 S15 A=$0000 
  T mmmmmmmm TIP BOOK #1 mmmmmmmmm      0 001         T20 S15 A=$0000 
* I INT TO FP CONVERT                 217 002         T21 S15 A=$0000 
* A FP TO INT CONVERT                 193 002         T22 S15 A=$0000 
* A DENSITY                           891 005         T23 S15 A=$0000 
* I INTEGER FLASHER                   347 003         T24 S15 A=$0000 
<snip>
  T mmmmmmmm TIP BOOK #2 mmmmmmmmm      0 001         T9 S15  A=$0000 
* A VISI-SORT                         759 004         T8 S15  A=$0000 
<snip>
  A D2                                703 004         T14 S8  A=$0000 
* A HELP                           14,065 056         T13 S5  A=$0000 
DOS 3.3 format; 29,440 bytes free; 113,920 bytes used.
```
