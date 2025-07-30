![AppleCommander Logo](images/AppleCommanderLogo.png)

AppleCommander is a cross-platform set of tools used to manipulate Apple ][ disk images.  There is a GUI packaged for Windows, Linux, or Mac OS X, and there are a number of command-line tools (see below) that are useful for build chains.  

Please visit [AppleCommander on GitHub](https://github.com/AppleCommander)!  You can find current releases, submit tickets, and lend a helping hand.

## Capabilities

AppleCommander is currently able to read and display information about disk images, export files of various types, create disk images, import files into disk images, and has a rudimentary compiler. AppleCommander incorporates support for [cc65](https://cc65.github.io/), an improved command-line tool, and even an Ant interface.

### Disk image organizations

* Compressed images (`*.gz`);
* 140K DOS-ordered images (`*.do`, `*.dsk`);
* 140K ProDOS-ordered images (`*.po`);
* 140K Nibble (DOS ordered) images (`*.nib`);
* 32MB ApplePC Hard Disk images (`*.hdv`).
* Universal Disk Images (`*.2mg`, `*.2img`);
* WOZ Disk Image, version 1 and 2 (`*.woz`) - 5.25" only

### Disk formats

* DOS (both 13-sector and 16-sector);
* UniDOS, OzDOS (800K formats only);
* ProDOS;
* Apple Pascal (140K and 800K formats);
* SSI's RDOS (140K formats only);
* CP/M (probably only 140K formats);
* Gutenberg Word Processor;
* NakedOS (see the [Super-Mon page](https://bitbucket.org/martin.haye/super-mon/wiki/Home)).

### Archive formats

* ShrinkIt (the archive will be automatically extracted into a ProDOS disk);
* AppleSingle.

### File export filters

* Raw disk data (dumps blocks or sectors without regard to file length or operating system storage);
* Binary file (dumps file without any conversion);
* Hex dump;
* Disassembly;
* ASCII file filter;
* Formatted assembly output;
* Pascal ".text" files;
* Applesoft BASIC file filter (file is de-tokenized and written out as a text file);
* Integer BASIC file filter (ditto);
* Business BASIC file (ditto);
* Graphic image file filter (supports black and white or color Hires images as well as black and white or color Double Hires images as well as standard Super Hires, and 3200 color Super Hires);
* Shape table support;
* Gutenberg Word processor;
* AppleWorks word processor (AWP) file filter (converts to text, poor HTML, or Rich-Text Format (RTF));
* AppleWorks database (ADB) file filter (converts to CSV);
* AppleWorks spread sheet (ASP) file filter (converts to CSV).

### Viewer capabilities

* BASIC programs (Applesoft and Integer BASIC); Applesoft BASIC is colored
* Graphics images (same as supported by the graphics export function)
* AppleWorks (database, spreadsheet, word processor)
* Text files (plain text, assembly source files, Pascal text files)
* Hex dump of all the above
* "Raw" format of all of the above; this includes all data as read from disk including length and starting address as well as full sectors/blocks

## Other CLI tooling

AppleCommander includes a number of command-line tools:

* `ac` (based on AppleCommander) - see the [ac page](ac/).
* `acx` (experimental utility for AppleCommander) - see the [acx page](acx/).
* `asu` (AppleSingle utility) - see the [asu README](https://github.com/AppleCommander/applesingle/blob/master/tools/asu/README.md).
* `bt` (Applesoft BASIC tokenizer tool) - see the [bt README](https://github.com/AppleCommander/bastools/blob/master/tools/bt/README.md).
* `st` (Applesoft shape utility) - see the [st README](https://github.com/AppleCommander/bastools/blob/master/tools/st/README.md).
* `acdasm` (6502/65C02/SWEET16 disassembler) - see the [README](https://github.com/AppleCommander/acdasm/blob/main/README.md).

Since the CLI tooling may be lacking, these additional resources should be useful:

* [Directives section in the API overview](https://github.com/AppleCommander/bastools/blob/master/api/README-TOKENIZER.md)
* [Source formats for the Shapes defined in the API](https://github.com/AppleCommander/bastools/blob/master/api/README-SHAPES.md)
* [bastools sample code](https://github.com/AppleCommander/bastools/tree/master/samples) 
