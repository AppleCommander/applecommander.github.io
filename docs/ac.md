`ac` is the command-line tool that provides access to the core of AppleCommander's capabilities.

## A quick note

All of these samples were done in a Unix-type environment (Mac OS X or Linux), hence the `$` is the prompt character.

Every sample assumes you have an `ac.jar` in the current directory and are therefore written out "long-hand".  If you followed the [install instructions](install.md), you have setup a command-line script to help you out, meaning that every `java -jar ac.jar` can be replaced with `ac.sh` or `ac.bat`.  Additionally if you setup an `alias`, you can replace that to just `ac`.  

Setup whatever works for you and your environment, and be cognizant that the sample commands probably aren't _quite_ exactly right for your setup!

## Options

For a quick list of `ac` options, enter the `-h` command:

```
$ java -jar ac.jar -h
AppleCommander command line options [1.6.0]:
-i       <imagename> [<imagename>] display information about image(s).
-ls      <imagename> [<imagename>] list brief directory of image(s).
-l       <imagename> [<imagename>] list directory of image(s).
-ll      <imagename> [<imagename>] list detailed directory of image(s).
-e       <imagename> <filename> [<output>] export file from image to stdout
         or to an output file.
-x       <imagename> [<directory>] extract all files from image to directory.
-g       <imagename> <filename> [<output>] get raw file from image to stdout
         or to an output file.
-p       <imagename> <filename> <type> [[$|0x]<addr>] put stdin
         in filename on image, using file type and address [0x2000].
-pt      <imagename> <filename> put stdin in filename on image
         defaulting to TXT file type, setting high bit on and replacing
         newline characters with $8D.
-ptx     <imagename> <filename> put stdin in filename on image
         defaulting to TXT file type, clearing high bit and replacing
         newline characters with $0D.
-d       <imagename> <filename> delete file from image.
-k       <imagename> <filename> lock file on image.
-u       <imagename> <filename> unlock file on image.
-n       <imagename> <volname> change volume name (ProDOS or Pascal).
-dos     <imagename> <filename> <type> put stdin with DOS header
         in filename on image, using file type and address from header.
-as      <imagename> [<filename>] put stdin with AppleSingle format
         in filename on image, using file type, address, and (optionally) name
         from the AppleSingle file.
-geos    <imagename> interpret stdin as a GEOS conversion file and
         place it on image (ProDOS only).
-dos140  <imagename> create a 140K DOS 3.3 image.
-pro140  <imagename> <volname>
         create a 140K ProDOS image.
-pro800  <imagename> <volname> create an 800K ProDOS image.
-pas140  <imagename> <volname> create a 140K Pascal image.
-pas800  <imagename> <volname> create an 800K Pascal image.
-convert <filename> <imagename> [<sizeblocks>] uncompress a ShrinkIt or Binary
         II file; or convert a DiskCopy 4.2 image into a ProDOS disk image.
-bas     <imagename> <filename> import an AppleSoft basic file from text
         back to its tokenized format.
```

> Note that the `-cc65` has been deprecated as CC65 itself is moving to using the AppleSingle format (`-as` flag).  Use `-dos` instead. `-cc65` will still be recognized, but it maps to `-dos` and a warning will be printed.

## Creating an image

| Type | Description |
| --- | --- |
| DOS 3.3 | The `-dos140` command creates an empty 140K DOS 3.3 disk image in DOS sector order; DOS volumes do not have names, and volume number is the default (254). |
| ProDOS | The `-pro140` command creates an empty 140K ProDOS disk image, and `-pro800` creates an empty 800K image, both in ProDOS sector order. |
| Pascal | The `-pas140` command creates an empty 140K Pascal disk image, and `-pas800` creates an empty 800K image, both in Pascal sector order. |

To be read correctly, DOS order disk image names should end in `.dsk` or `.do`, while ProDOS and Pascal order image names should end in `.po`. The resulting images will not boot, but they can be edited with the traditional utilities.

To create a DOS 3.3, Pascal and ProDOS image, enter the commands:

```
$ java -jar ac.jar -dos140 dos.dsk
$ java -jar ac.jar -pas140 pas.po volume1
$ java -jar ac.jar -pro140 pro.po volume2
```

There is no textual output from this command (unless an error occurs) beyond having a new blank disk image.

## Displaying information about an image

The `-i` command displays information about a disk image. Multiple image names are permitted.

To get information about one or more disks, enter any of the following commands:

```
$ java -jar ac.jar -i ricky.2mg
$ java -jar ac.jar -i fred.dsk ethel.po
$ java -jar ac.jar -i mertz/*
$ java -jar ac.jar -i *.po *.dsk
```

A sample from the ProDOS 2.4.2 master disk:

```
$ java -jar ac.jar -i ProDOS_2_4_2.dsk
File Name: ProDOS_2_4_2.dsk
Disk Name: /PRODOS.2.4.2/
Physical Size (bytes): 143360
Free Space (bytes): 0
Used Space (bytes): 143360
Physical Size (KB): 140
Free Space (KB): 0
Used Space (KB): 140
Archive Order: DOS
Disk Format: ProDOS
Total Blocks: 280
Free Blocks: 0
Used Blocks: 280
Volume Access: Destroy Read Rename Write
Block Number of Bitmap: 6
Creation Date: 09/19/2016
File Entries Per Block: 13
File Entry Length (bytes): 39
Active Files in Root Directory: 19
Minimum ProDOS Version Required: 0
Volume Created By ProDOS Version: 0
Volume Name: PRODOS.2.4.2
```

## Directory listings

The `-ls`, `-l` and `-ll` commands list the directory of a disk image in short, regular and long format respectively. Multiple image names are permitted, as suggested above. To see the directory of one or more disk, enter any of the following commands:

```
$ java -jar ac.jar -ls misc.dsk
$ java -jar ac.jar -l  misc.dsk
$ java -jar ac.jar -ll misc.dsk
$ java -jar ac.jar -ls *.po *.dsk
$ java -jar ac.jar -l  Nibble*/*
```

Sample runs (with some text omitted for brevity):

```
$ java -jar ac.jar -ls ProDOS_2_4_2.dsk
/home/rob/Downloads/ProDOS_2_4_2.dsk /PRODOS.2.4.2/
VIEW.README BAS 512  
<snip>
PRODOS SYS 17,128 Locked
ProDOS format; 0 bytes free; 143,360 bytes used.

$ java -jar ac.jar -l ProDOS_2_4_2.dsk
/home/rob/Downloads/ProDOS_2_4_2.dsk /PRODOS.2.4.2/
  VIEW.README BAS 001 09/15/2016 01/13/2018 512 A=$0801
<snip>
* PRODOS SYS 034 01/18/2018 01/13/2018 17,128  
ProDOS format; 0 bytes free; 143,360 bytes used.

$ java -jar ac.jar -ll ProDOS_2_4_2.dsk
/home/rob/Downloads/ProDOS_2_4_2.dsk /PRODOS.2.4.2/
  VIEW.README  Destroy Read Rename Write BAS  001 09/15/2016 01/13/2018 512 A=$0801 0002 0116 Seedling Changed 0 36
<snip>
* PRODOS  Read  SYS  034 01/18/2018 01/13/2018 17,128 $0000 0002 0005 Sapling Changed 0 36
ProDOS format; 0 bytes free; 143,360 bytes used.
```

## Examining a file

The `-e` command lets you examine a file by printing a readable version to standard output. To examine a file named `fred` on a disk named `misc.dsk`, enter the command:
```
$ java -jar ac.jar -e misc.dsk fred
```

The export command tries to choose an appropriate filter for the chosen file. Filters exist for formats, with a default hexadecimal format for binary files. If the file is probably a picture, the export format is PNG. To save the output to a file:
```
$ java -jar ac.jar -e misc.dsk lucy.pic > lucy.png
```

A sample run against an AppleSoft BASIC program on the ProDOS 2.4.2 disk:
```
$ java -jar ac.jar -e ProDOS_2_4_2.dsk VIEW.README
10  REM VIEW.README BY J.BROOKS. 9/15/2016
20 ADR = 768
30  READ BYTE: IF BYTE <0  THEN 100
40  POKE ADR,BYTE:ADR = ADR +1: GOTO 30
100  CALL 806
150  PRINT  CHR$(4)"BLOAD README,A$2000,TTXT"
200  HOME : FOR I = 1 TO 22: CALL 768: NEXT
300  CALL 768: GET KEY$
350  IF  ASC(KEY$) = 27 GOTO 500
400  IF  PEEK(251) >0 GOTO 300
500  PRINT  CHR$(4)"bye"
1000  DATA 162,40,160,0,177,250,240,29,9,128,201,225,144,2,41,255,32,237,253,200,201,141,240,3,202,208,233,152,24,101,250,133,250,144,2,230,251,96,162,96,169,32,133,251,141,54,3,169
1010  DATA 0,133,250,168,153,0,32,200,208,250,238,54,3,202,208,244,26,208,2,160,224,136,140,15,3,96,-1
```

## Get a raw data file

The `-g` command gets a file in its raw form. To copy a file named `fred` from `misc.dsk` to a file named `ethel` on your file system, enter the command:
```
$ java -jar ac.jar -g misc.dsk fred > ethel
```

Because binary files are difficult to read, you may want to send the output to a program that can show the data in a hexadecimal format other than the one used with the `-e` option, above:
```
$ java -jar ac.jar -g misc.dsk fred | hexdump
```

Again, a sample run with the AppleSoft BASIC program from the ProDOS 2.4.2 image.  This time, however, you will see the tokenized program:
```
$ java -jar ac.jar -g ProDOS_2_4_2.dsk VIEW.README | hexdump -C
00000000  29 08 0a 00 b2 56 49 45  57 2e 52 45 41 44 4d 45  |)....VIEW.README|
00000010  20 42 59 20 4a 2e 42 52  4f 4f 4b 53 2e 20 39 2f  | BY J.BROOKS. 9/|
00000020  31 35 2f 32 30 31 36 00  35 08 14 00 41 44 52 d0  |15/2016.5...ADR.|
00000030  37 36 38 00 4b 08 1e 00  87 42 59 54 45 3a ad 42  |768.K....BYTE:.B|
00000040  59 54 45 d1 30 c4 31 30  30 00 67 08 28 00 b9 41  |YTE.0.100.g.(..A|
00000050  44 52 2c 42 59 54 45 3a  41 44 52 d0 41 44 52 c8  |DR,BYTE:ADR.ADR.|
00000060  31 3a ab 33 30 00 70 08  64 00 8c 38 30 36 00 94  |1:.30.p.d..806..|
00000070  08 96 00 ba e7 28 34 29  22 42 4c 4f 41 44 20 52  |.....(4)"BLOAD R|
00000080  45 41 44 4d 45 2c 41 24  32 30 30 30 2c 54 54 58  |EADME,A$2000,TTX|
<snip>
000001f0  30 2c 31 35 2c 33 2c 39  36 2c 2d 31 00 00 00 e8  |0,15,3,96,-1....|
00000200
```

## Put standard input onto disk image

The `-p` command puts data from the standard input stream onto a disk image. Four parameters are used: imagename, filename, type, and address. If the address is omitted and one is required, $2000 is assumed. Suppose `ethel` is a binary file meant to start at address 2048 ($800 or 0x800). To put the binary file named `ethel` back into a file named `fred` with that starting address on the DOS image named `misc.dsk`:
```
$ java -jar ac.jar -p misc.dsk fred B 0x800 < ethel
```

Alternatively, suppose `ethel` is a binary starting at 2048 destined for `fred` on a ProDOS image named `p1.po`:
```
$ java -jar ac.jar -p p1.po fred bin 2048 < ethel
```

## Put standard input onto disk image as a text file

The `-pt` and `-ptx` commands work the same as `-p` except that they assume the input is a text file. This defaults the file type to `TXT`. They also translate the MS-DOS CR+LF format into a single line ending.

A sample using the `CONTRIB.txt` file in this archive, which happes to be in MS-DOS format:
```
$ cat CONTRIB.txt | hexdump -C
00000000  41 70 70 6c 65 43 6f 6d  6d 61 6e 64 65 72 20 2d  |AppleCommander -|
00000010  20 41 6e 20 41 70 70 6c  65 20 5d 5b 20 69 6d 61  | An Apple ][ ima|
00000020  67 65 20 75 74 69 6c 69  74 79 2e 0d 0a 43 6f 70  |ge utility...Cop|
<snip>
$ # Note the CR + LF is here .............. ^^ ^^
```

For `-pt`, it translates line endings to the Apple 0x8d as well as _setting_ the high bit:
```
$ cat CONTRIB.txt | ac -pt test.dsk contrib
$ ac -g test.dsk contrib | hexdump -C
00000000  c1 f0 f0 ec e5 c3 ef ed  ed e1 ee e4 e5 f2 a0 ad  |................|
00000010  a0 c1 ee a0 c1 f0 f0 ec  e5 a0 dd db a0 e9 ed e1  |................|
00000020  e7 e5 a0 f5 f4 e9 ec e9  f4 f9 ae 8d c3 ef f0 f9  |................|
<snip>
$ # Note that the CR + LF is fixed ........ ^^
```

For `-ptx`, it translates line endings to the Apple 0x0d as well as _clearing_ the high bit:
```
$ cat CONTRIB.txt | ac -ptx test.dsk contrib2
$ ac -g test.dsk contrib2 | hexdump -C
00000000  41 70 70 6c 65 43 6f 6d  6d 61 6e 64 65 72 20 2d  |AppleCommander -|
00000010  20 41 6e 20 41 70 70 6c  65 20 5d 5b 20 69 6d 61  | An Apple ][ ima|
00000020  67 65 20 75 74 69 6c 69  74 79 2e 0d 43 6f 70 79  |ge utility..Copy|
<snip>
$ # Note that the CR + LF is fixed ........ ^^
```

## Put standard input BASIC source code onto disk image as a BASIC file

With the addition of the [bastools](https://github.com/AppleCommander/bastools) library, `ac` now has the ability to tokenize a BASIC program and place it onto the disk. Please see the [bt](https://github.com/AppleCommander/bastools/tree/master/tools/bt) and [st](https://github.com/AppleCommander/bastools/tree/master/tools/st) for more advanced capabilities!

> Note: Due to the bastools API, `ac` will create a temp file in the system temp folder and then delete it once completed. 

```
$ cat sample.bas 
10 TEXT:HOME:GR:POKE -16302,23
20 COLOR=0:FOR I=41 TO 47 STEP 2:HLIN 0,39 AT I:NEXT
30 COLOR=INT(RND(1)*16)
40 PLOT INT(RND(1)*40),INT(RND(1)*48)
50 IF PEEK(49152)<128 THEN 30
60 GET A$:TEXT:HOME
$ cat sample.bas | ac -bas test.dsk sample
$ ac -g test.dsk sample | hexdump -C
00000000  16 08 0a 00 89 3a 97 3a  88 3a b9 c9 31 36 33 30  |.....:.:.:..1630|
00000010  32 2c 32 33 00 32 08 14  00 a0 30 3a 81 49 d0 34  |2,23.2....0:.I.4|
00000020  31 c1 34 37 c7 32 3a 8e  30 2c 33 39 c5 49 3a 82  |1.47.2:.0,39.I:.|
00000030  00 42 08 1e 00 a0 d3 28  db 28 31 29 ca 31 36 29  |.B.....(.(1).16)|
00000040  00 5d 08 28 00 8d d3 28  db 28 31 29 ca 34 30 29  |.].(...(.(1).40)|
00000050  2c d3 28 db 28 31 29 ca  34 38 29 00 72 08 32 00  |,.(.(1).48).r.2.|
00000060  ad e2 28 34 39 31 35 32  29 d1 31 32 38 c4 33 30  |..(49152).128.30|
00000070  00 7e 08 3c 00 be 41 24  3a 89 3a 97 00 00 00     |.~.<..A$:.:....|
0000007f
```

## Put standard input with DOS 3.3 header onto disk image

The `-dos` command is like `-p`, but it assumes the input stream includes a four-byte header, as generated by older versions of `cc65`. Three parameters are required: imagename, filename, and type. The start address is taken from bytes 0-1 of the header. To put the DOS binary named `ethel` into a file named `fred` on the DOS image named `misc.dsk`:
```
$ java -jar ac.jar -dos misc.dsk fred B < ethel
```

## Put standard input in AppleSingle format onto disk image

The `-as` command is like `-p`, but it assumes the input stream is in the AppleSingle format, as generated by newer versions of `cc65` ([see ticket #20](https://github.com/AppleCommander/AppleCommander/issues/20)). The parameters are imagename (required) and, optionally, filename. The AppleSingle format supports a filename entry, but it is not always populated.  To put the AppleSingle binary named `ethel` into a file named `fred` on the ProDOS image named `misc.dsk`:
```
$ java -jar ac.jar -as misc.dsk fred < ethel
```

## Putting files and file types

As another example, consider the text file named `foo.text` and the Pascal image named `src.po`:
```
$ java -jar ac.jar -p p2.po foo.text text < foo.text
```

Valid file types are specific to each operating system:

| Operating System | File Types |
| --- | --- |
| DOS 3.x | `A`, `B`, `I`, `T`, `S`, `R`, `a`, `b`. |
| Pascal | `bad`, `code`, `text`, `info`, `data`, `graf`, `foto`. |
| ProDOS | `bas`, `bin`, `sys`, `txt`, `rel`, etc.; see `ProdosFileTypes.properties` for more. |

## Delete a file

The `-d` command deletes a file from an image:
```
$ java -jar ac.jar -d misc.dsk fred
```

## Copying a file between disks

To copy a file from one image to another, do something like this:

```
$ java -jar ac.jar -g one.dsk fred | java -jar ac.jar -p another.dsk fred bin 2048
```

## Locking and unlocking a file

The `-k` and `-u` commands lock and unlock a file on the given image:
```
$ java -jar ac.jar -k misc.dsk fred
$ java -jar ac.jar -u misc.dsk fred
```

## Change a volume name

The `-n` command changes the volume name on an image. Only ProDOS and Pascal images are affected:
```
$ java -jar ac.jar -n misc.po name
```

## Further details

* Here's a more comprehensive example of using AppleCommander for [cross-platform development](https://sites.google.com/site/drjohnbmatthews/apple2/cross).
* It's also possible to invoke the command line functions from within the ant build environment by using AppleCommander's [ant interface](dev-notes/ant.md).
* The `-geos` transfer file format is specified in [Apple GEOS CONVERT Format](http://wiki.cc65.org/doku.php?id=cc65:apple2:geosconvertformat).

## Known problems & limitations

* To replace an existing file on an image, you must delete it first; `ac` will create as many duplicate entries as you specify, only one of which will be accessible to the operating system.
* Given a ProDOS image, a full pathname may be specified for the `-e`, `-g`, `-p`, `-d`, `-k`, `-u`, `-dos`, and `-as` options. Files can only be put into an existing directory.
