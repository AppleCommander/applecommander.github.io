`acx` is a new command-line tool for AppleCommander.  This tool is subcommand based (think `git pull` and `git commit`) and is expected to allow more nuanced command activities.

## Overview / Asking for help

All commands and subcommands will show options and command structure with the `--help` flag. 

```shell
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
  help             Display help information about the specified command.
  import, put      Import file onto disk.
  info, i          Show information on a disk image(s).
  list, ls         List directory of disk image(s).
  lock             Lock file(s) on a disk image.
  mkdir, md        Create a directory on disk.
  read             Read a block or sector.
  rename, ren      Rename file on a disk image.
  rename-disk      Rename volume of a disk image.
  rmdir, rd        Remove a directory on disk.
  scan             Scan directory and report on disks found and understood.
  unlock           Unlock file(s) on a disk image.
  write            Write a block or sector.
```

When looking for options for a subcommand, the `help` subcommand may be used as an alternate (`acx copy --help` or `acx help copy` are both valid).

```shell
$ acx copy --help
Usage: acx copy [-fhr] [-k=<diskNumber>] [--to=<targetPath>] -d=<disks>
                [-d=<disks>]... -s=<sourceDisks> [-s=<sourceDisks>]...
                [<globs>...]

Copy files between disks.

Parameters:
      [<globs>...]     File glob(s) to copy (default = '*')

Options:
  -d, --disk=<disks>   Image to process [$ACX_DISK_NAME].
  -f, --force          Overwrite existing files.
  -h, --help           Show help for subcommand.
  -k, --number=<diskNumber>
                       Select disk number to access [$ACX_DISK_NUMBER].
  -r, --recursive      Copy files recursively.
  -s, --from, --source=<sourceDisks>
                       Source disk for files.
      --to, --directory=<targetPath>
                       Specify which directory to place files.
```

## Identifying a disk

`acx` differs from `ac` in that the primary disk image is always specified by the `-d` flag.  However, this can be painful when running a series of commands.  To simplify usage, the environment variable `ACX_DISK_NAME` can be set to simplify scripting.

This means that a sequence of commands that look like this:
```shell
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
```shell
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

```shell
$ acx create -d disk1.po --format ProDOS_2_4_2.dsk --prodos --size=140kb
$ acx create -d disk2.dsk --format original332sysmas.nib --dos --size=140kb
$ acx create -d disk3.po --format UCSD\ Pascal\ 1.2_0.DSK --pascal
```

> Note that Pascal doesn't copy any files. Looking for feedback or PR's to correct this!

For ProDOS and Pascal, the boot block is copied over and in the ProDOS case, `STARTUP` and `BASIC.SYSTEM` as well. For DOS 3.3, tracks 0-2 are copied and marked as used.

## Dumping a block or sector

`acx` can dump any sector or block in a hex format:

```shell
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

Or a range of them:

```shell
$ acx dump -d original332sysmas.do -t 17 -s 1-15
Track 17, Sector 01:
Offset   Hex Data                                          Characters
=======  ================================================  =================
$000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
$000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
<snip>

Track 17, Sector 02:
Offset   Hex Data                                          Characters
=======  ================================================  =================
$000000  00 11 01 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
$000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
<snip>

Track 17, Sector 15:
Offset   Hex Data                                          Characters
=======  ================================================  =================
$000000  00 11 0E 00 00 00 00 00  00 00 00 1A 0F 82 C8 C5  ........ ......HE
$000010  CC CC CF A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 A0 A0  LLO              
$000020  A0 A0 A0 A0 A0 A0 A0 A0  A0 A0 A0 A0 03 00 1A 0C               ....
$000030  81 C1 D0 D0 CC C5 D3 CF  C6 D4 A0 A0 A0 A0 A0 A0  .APPLESO FT      
$000040  A0 A0 A0 A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 A0 03                  .
$000050  00 1A 09 84 CC CF C1 C4  C5 D2 AE CF C2 CA B0 A0  ....LOAD ER.OBJ0 
$000060  A0 A0 A0 A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 A0 A0                   
$000070  A0 A0 06 00 1A 03 84 C6  D0 C2 C1 D3 C9 C3 A0 A0    .....F PBASIC  
$000080  A0 A0 A0 A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 A0 A0                   
$000090  A0 A0 A0 A0 A0 2A 00 1D  09 84 C9 CE D4 C2 C1 D3       *.. ..INTBAS
$0000A0  C9 C3 A0 A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 A0 A0  IC               
$0000B0  A0 A0 A0 A0 A0 A0 A0 A0  2A 00 20 0F 82 CD C1 D3           *. ..MAS
$0000C0  D4 C5 D2 A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 A0 A0  TER              
$0000D0  A0 A0 A0 A0 A0 A0 A0 A0  A0 A0 A0 03 00 20 0C 84              .. ..
$0000E0  CD C1 D3 D4 C5 D2 A0 C3  D2 C5 C1 D4 C5 A0 A0 A0  MASTER C REATE   
$0000F0  A0 A0 A0 A0 A0 A0 A0 A0  A0 A0 A0 A0 A0 A0 09 00                 ..
** END **
```

## Disassembling the boot sector

`acx` can dump any sector or block in a disassembled format:

```shell
$ acx dump -d ~/Downloads/ProDOS_2_4_3.po -t 0 -s 0 --disassembly
Track 00, Sector 00:
0801- 38                   SEC                                  
0802- B0 03                BCS   L0807                          
0804- 4C 32 A1             JMP   $A132                          
0807- 86 43     L0807      STX   $43                            
0809- C9 03                CMP   #$03                           
080B- 08                   PHP                                  
080C- 8A                   TXA                                  
080D- 29 70                AND   #$70                           
080F- 4A                   LSR                                  
0810- 4A                   LSR                                  
0811- 4A                   LSR                                  
0812- 4A                   LSR                                  
0813- 09 C0                ORA   #$C0                           
0815- 85 49                STA   $49                            
0817- A0 FF                LDY   #$FF                           
0819- 84 48                STY   $48                            
081B- 28                   PLP                                  
081C- C8                   INY                                  
081D- B1 48                LDA   ($48),Y                        
081F- D0 3A                BNE   L085B                          
0821- B0 0E                BCS   L0831                          
0823- A9 03                LDA   #$03                           
0825- 8D 00 08             STA   $0800 
<snip>
```

## File listings by name pattern

A new feature when listing files is that `acx` allows "glob" pattern matching ("*" wildcard matching). (Be careful with the usual shell expansion issues.)

For example, to list files that might be run at startup (`*.SYSTEM`):

```shell
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

```shell
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

```shell
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

```shell
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

## Scan directory to identify/classify files

This was added in `acx` version 1.11.0. The primary intention is to track any slips in ongoing code changes but may also be useful to others.

Note that each record is an independent JSON structure. It will work with tools such as `jq` (see below for sample).

Sample run: (for more output, use `acx -vvv scan ./Apple2/ -o newscan.json` for more verbosity)

```shell
$ acx scan ./Apple2/ -o newscan.json
Scanned 3820 disk images.
```

Success record:

```json
{
  "imageName": "./Apple2/APPLE-II-DISK-IMAGES/programming/assembler/prodosexerciser.dsk",
  "success": true,
  "imageType": "ProDOS",
  "logicalDisks": 1,
  "deletedFiles": 0,
  "directoriesVisited": 1,
  "filesVisited": 2,
  "filesRead": 2,
  "dataType": "blocks",
  "dataRead": 280,
  "errors": []
}
```

Failure record: (one of many types)

```json
{
  "imageName": "./Apple2/APPLE-II-DISK-IMAGES/programming/basic/tipdisk1.sdk",
  "success": false,
  "imageType": "DOS 3.3",
  "logicalDisks": 1,
  "deletedFiles": 0,
  "directoriesVisited": 1,
  "filesVisited": 117,
  "filesRead": 116,
  "dataType": "sectors",
  "dataRead": 560,
  "errors": [
    "Unable to read file 0/DISK VOLUME #254/(C) 1981, BEAGLE BROS, INC.: arraycopy: last source index 54740 out of bounds for byte[256]"
  ]
}
```

Using `jq`: (selects failures that have the `Unknown ProDOS storage type!` error message)

```shell
$ cat newscan.json | jq -r 'select(.success | not) | select(.errors | contains(["Unknown ProDOS storage type!"]))'
<snip>
{
  "imageName": "./Apple2/System 6.0.1/Disk 1 of 7 Install.2mg",
  "success": false,
  "imageType": "ProDOS",
  "logicalDisks": 1,
  "deletedFiles": 1,
  "directoriesVisited": 11,
  "filesVisited": 97,
  "filesRead": 91,
  "dataType": "blocks",
  "dataRead": 1600,
  "errors": [
    "Unable to read file 0/SYSTEM.SETUP/SYS.RESOURCES: Unknown ProDOS storage type!",
    "Unable to read file 0/CDEVS/SETSTART: Unknown ProDOS storage type!",
    "Unable to read file 0/CDEVS/GENERAL: Unknown ProDOS storage type!",
    "Unable to read file 0/CDEVS/RAM: Unknown ProDOS storage type!",
    "Unable to read file 0/DESK.ACCS/CONTROLPANEL: Unknown ProDOS storage type!",
    "Unable to read file 0//INSTALL//INSTALLER: Unknown ProDOS storage type!"
  ]
}
<snip>
```

# Inspecting nibble images

The `acx` tool also allows some inspection of nibble images, should that be of interest.

For instance, there are a few protected images where AppleCommander can identify the encoding for the track. This is visible in the `info` subcommand:

```shell
$ acx info -d apple_II/images/games/rpg/ultima/ultima_I/ultima_i_boot.nib
File Name: apple_II/images/games/rpg/ultima/ultima_I/ultima_i_boot.nib
Disk Name: DISK VOLUME #254
Free Space (bytes): 0
Used Space (bytes): 116480
Free Space (KB): 0
Used Space (KB): 113
Disk Format: DOS 3.2
Total Sectors: 455
Free Sectors: 0
Used Sectors: 455
Tracks On Disk: 35
Sectors On Disk: 13
Catalog Track (non-standard): 20
Device: Nibble Device
Geometry: 35 tracks, 13 sectors
Total Sectors: 455
Prolog/Epilog Bytes (T00): D5AAB5/D5AAAD (13 sectors on track)
Prolog/Epilog Bytes (T01): DFAAB7/DFAAFD (13 sectors on track)
Prolog/Epilog Bytes (T02): DDAAF5/D7AAFD (13 sectors on track)
Prolog/Epilog Bytes (T03): DDAAF7/DFAAFD (13 sectors on track)
Prolog/Epilog Bytes (T04): DFAAF5/DFAABD (13 sectors on track)
Prolog/Epilog Bytes (T05): DDAAF5/DDAAFD (13 sectors on track)
<snip>
```

The track nibble data can be viewed as well:

```shell
$ acx dump -d apple_II/images/games/rpg/ultima/ultima_I/ultima_i_boot.nib -n 1
Track 01
Offset   Hex Data                                          Characters
=======  ================================================  =================
$000000  AD B6 BB AB EB D6 DD BB  AB EB AB FE DD F7 FD BA  -6;+kV]; +k+~]w}:
$000010  FA B5 B5 F7 DB AB F5 D7  AB AB F5 F6 AD DB F7 F6  z55w[+uW ++uv-[wv
$000020  D6 AD AB AB AB AB FD FB  BA B5 BA DE FE F3 D9 FF  V-++++}{ :5:^~sY.
$000030  DF CF E7 F3 F9 FC FE FE  FE FE FE FE FE FE FE FE  _Ogsy|~~ ~~~~~~~~
$000040  FE FE FE FE FE FE FE FE  FE FE FE FE FE FE FE FE  ~~~~~~~~ ~~~~~~~~
$000050  FE FE FE FE FE FE FE FE  FE FE DF AA B7 FF FE AA  ~~~~~~~~ ~~_*7.~*
$000060  AB AA AB FF FE FE E7 F2  89 9F CF E7 F3 F9 FC FE  +*+.~~gr ..Ogsy|~
$000070  FE FE FE FE FE DF AA FD  B7 D6 B7 BD FB DB D6 DF  ~~~~~_*} 7V7={[V_
$000080  F7 EF ED DD AF B7 B5 BB  F6 EB BA AF AF AE BF DA  wom]/75; vk://.?Z
$000090  B6 BF FB EB BA B6 AB AE  AE BE DB AB F5 DB ED BA  6?{k:6+. .>[+u[m:
$0000A0  D6 B5 F6 B5 AD FF F5 DF  BA FA BB DD B5 AD EE EF  V5v5-.u_ :z;]5-no
<snip>
```

And, of course, if the protected disk is a gussied up DOS, you can view the contents:

```shell
$ acx list -d apple_II/images/games/rpg/ultima/ultima_I/ultima_i_boot.nib

File: apple_II/images/games/rpg/ultima/ultima_I/ultima_i_boot.nib
Name: DISK VOLUME #254
* A 003 ULTIMA                         
* B 033 PIC.ULTIMATUM                  
* A 019 INIT DISPLAY                   
* A 044 OUT MOVE                       
* A 057 TWN MOVE                       
* A 048 CAS MOVE                       
* A 5,166 DNG MOVE 1                     
* B 011 SET1                           
* B 011 SET2                           
* B 011 SET3                           
* B 011 SET4                           
* B 010 SET5                           
* A 037 SPA MOVE                       
* T 5,122 INFO                           
* B 004 ULTSHAPES                      
* B 003 DRAW 64.OBJ                    
* B 003 OUT.SHAPES                     
* B 002 TWN.CAS.SHAPES                 
* B 005 SPA.SHAPES                     
* B 002 NEAR.OBJ                       
* B 5,126 STAR.OBJ                       
* B 003 FGT3                           
* B 002 FIRE                           
DOS 3.2 format; 0 bytes free; 116,480 bytes used.
```
* The crazy block sizes are because AppleCommander decodes both bytes of the block size but DOS doesn't. Regardless, they are crazy.

```shell
$ acx get -d apple_II/images/games/rpg/ultima/ultima_I/ultima_i_boot.nib ULTIMA
0  ONERR  GOTO 9900
28  HGR : TEXT : HOME : VTAB (12): HTAB (16): PRINT "--ULTIMA--"
29  PRINT "<CTRL-D>BLOAD PIC.ULTIMATUM,A$2000"
30  POKE  - 16302,0: POKE  - 16297,0: POKE  - 16300,0: POKE  - 16304,0
40  POKE 103,1: POKE 104,64: POKE 16384,0: PRINT  CHR$(4);"RUN INIT DISPLAY"
9900  POKE 49235,0: VTAB 24: PRINT : PRINT : IF  PEEK(222) = 4 THEN  PRINT "PROTECT";: GOTO 9930
9910  IF  PEEK(222) = 8 THEN  PRINT "I/O";: GOTO 9940
9920  PRINT "TYPE "; PEEK(222);
9930  PRINT "<CTRL-G> ERROR IN LINE "; PEEK(218) + 256 *  PEEK(219): PRINT "PLEASE HIT ESC ";: POKE 49168,0
9940  GET D$: IF D$ <  >  CHR$(27) THEN 9940
9950 D$ =  CHR$(4): PRINT : IF  PEEK(222) = 4 OR  PEEK(222) = 8 THEN  RESUME 
9960  CALL  - 16640
```
