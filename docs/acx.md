`acx` is a new command-line tool for AppleCommander.  This tool is subcommand based (think `git pull` versus `git commit`) and is expected to allow more nuanced command activities.

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
  convert          Uncompress a ShrinkIt or Binary II file; or convert a
                     DiskCopy 4.2 image into a ProDOS disk image.
  copy, cp         Copy files between disks.
  create, mkdisk   Create a disk image.
  delete, del, rm  Delete file(s) from a disk image.
  diskmap, map     Show disk usage map.
  export, x, get   Export file(s) from a disk image.
  help             Displays help information about the specified command
  import, put      Import file onto disk.
  info, i          Show information on a disk image(s).
  list, ls         List directory of disk image(s).
  lock             Lock file(s) on a disk image.
  mkdir, md        Create a directory on disk.
  rename, ren      Rename file on a disk image.
  rename-disk      Rename volume of a disk image.
  rmdir, rd        Remove a directory on disk.
  unlock           Unlock file(s) on a disk image.
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

## Identifying disk

`acx` differs from `ac` in that the primary disk image is _always_ specified by the `-d` flag.  However, this can be painful when running a series of commands.  To simplify usage, the environment variable `ACX_DISK_NAME` can be set to simplify scripting.

This means that a sequence of commands that look like this:
```
$ acx create -d disk1.po --prodos
$ acx copy -d disk1.po --from ProDOS_2_4_2.dsk PRODOS
$ acx list -d disk1.po --native

File: disk1.po
Name: /NEW.DISK/
* PRODOS          SYS      035 01/15/2022 01/13/2018     17,128          
ProDOS format; 121,856 bytes free; 21,504 bytes used.
```

Can also be specified in this manner:
```
$ export ACX_DISK_NAME=disk2.po
$ acx create --prodos
$ acx copy --from ProDOS_2_4_2.dsk PRODOS BASIC.SYSTEM
$ acx list --native

File: disk2.po
Name: /NEW.DISK/
* BASIC.SYSTEM    SYS      021 01/15/2022 01/13/2018     10,240 A=$2000  
* PRODOS          SYS      035 01/15/2022 01/13/2018     17,128          
ProDOS format; 111,104 bytes free; 32,256 bytes used.
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

List `ac`, `acx` allows file listings to be written out as structured text.  Specifically, with JSON output, secondary processing tools can be used to extract information:

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
