A new release of AppleCommander is available!

Version 1.3.1 introduces file viewing as well as John Matthews command-line version of AppleCommander (`ac`). The beginnings of an AppleSoft compiler have been added (strictly beta and incomplete). Full gory details are listed below for both the unannounced 1.3.0 as well as the current 1.3.1.

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

John Matthews' command-line "ac" utility is available at:

    http://www.wright.edu/~john.matthews/ac.html

If you're interested, please take a peek and let me know what you think!

-Rob

New for version 1.3.1 (2003-12-12):

* Short-cut keys have been implemented.
        From AppleCommander window:
        - CTRL+O = Open a disk image
        - CTRL+C = Create a new disk image
        - CTRL+A = About...
* - From disk window
        - Toolbar shortcuts:
            - F2 = Standard file view
            - F3 = Native file view
            - F4 = Detail file view
            - F5 = Show deleted files
            - CTRL+I = Import files wizard
            - CTRL+S = Save
            - CTRL+SHIFT+S = Save As
        - Directory shortcuts (in addition to toolbar shortcuts)
            - "+" = expand one level
            - "-" = close one level
            - CTRL+"+" = expand fully
            - CTRL+"-" = close fully
        - File shortcuts (in addition to toolbar shortcuts)
            - CTRL+E = Export file wizard
            - CTRL+C = Compile BASIC program (BETA)
            - CTRL+V = View file (later version)
            - CTRL+D = Delete file
* Spent time ensuring that buttons, context menus, and shortcuts are enabled or disabled as appropriate.
* Save does not allow the disk image location to be chosen for new images:
    - Implemented Save As
    - A save on a new image invokes Save As
* File preview supports:
    - BASIC programs (Applesoft and Integer BASIC); Applesoft BASIC is colored
    - Graphics images (same as supported by the graphics export function)
    - Appleworks (database, spreadsheet, word processor)
    - Text files
    - Hex dump of all the above
    - "Raw" format of all of the above; this includes all data as read from disk including length and starting address as well as full sectors/blocks
    - Shortcuts available:
        - F2 = Native format view (as applicable)
        - F3 = Hex dump view
        - F4 = Raw hex dump of disk bytes (includes length or address start along with all bytes stored on disk - a multiple of 256 or 512 depending on disk format)
        - CTRL+A = Select all (only text formats)
        - CTRL+C = Copy to clipboard (only text formats)
        - CTRL+P = Print
* Printing is available from the file preview.
* Copy is avilable from file preview except for images.
* Opening an invalid disk image (or a file that is not a disk image) no longer crashes AppleCommander.
* Provide a command-line interface - John Matthews "ac" is now supplied as part of the AppleCommander distribution. If AppleCommander gets no command-line arguments, the GUI version is launched. Otherwise, AppleCommander reserves the following messages:
    - `-swt` = force SWT version
    - `-swing` = force Swing version (N/A - may be removed)
    - `-command` = force command interpreter (not done - may be superseded by the "ac" utility)
    - `-help` or -? = general help messages
    - Everything else is passed on to John's "ac" command-line version (from the application help):
        - AppleCommander command line options:
        - `-l` list directory of image.
        - `-e` export file from image to stdout.
        - `-g` get raw file from image to stdout.
        - `-p` put stdin in destname on image, using file type and address.
        - `-d` delete file from image.
        - `-p140` create a 140K ProDOS image.
        - `-p800` create a 800K ProDOS image.

New for version 1.3.0 (2003-12-05):

* HDV disks are not always created to their full capacity. AppleCommander, however, assumes that the size of the file on disk is the size of the disk. (Really!) This is an issue because the ProDOS bitmap indicates there is a certain amount of space and AppleCommander just assumes that the data exists.
* Incorporated fixes from John Matthews. See:

        http://www.wright.edu/~john.matthews/ac.html

* Early release of Applesoft BASIC compiler. This currently is limited to assembly of small programs. If a command is not compiled, you are likely to just get an error about expecting a line number. Expressions are not very complete. Supported commands are:

        END, FLASH, FOR, GOTO, GR, HCOLOR, HGR, HGR2, HOME, HPLOT, HTAB, INVERSE, NEXT, NORMAL, PRINT, RETURN, TEXT, VTAB

* Unsupported commands are:

        ABS, AND, ASC, AT, ATN, CALL, CHR$, CLEAR, COLOR=, CONT, COS, DATA, DEF, DEL, DIM, DRAW, EXP, FN, FRE, GET, GOSUB, GR, HIMEM:, HLIN, IF, IN#, INPUT, INT, LEFT$, LEN, LET, LIST, LOAD, LOG, LOMEM:, MID$, NEW, NOT, NOTRACE, ON, ONERR, OR, PDL, PEEK, PLOT, POKE, POP, POS, PR#, READ, RECALL, REM, RESTORE, RESUME, RIGHT$, RND, ROT=, RUN, SAVE, SCALE=, SCRN, SGN, SHLOAD, SIN, SPC, SPEED=, SQR, STEP, STOP, STORE, STR$, TAB, TAN, THEN, TO, TRACE, USR, VAL, VLIN, WAIT, XDRAW, &

* Note that the compiler is not very sophisticated.
* Updated build notes and process.
* DELETE does not seem to delete in all circumstances. (JM caught this one.)

[The End.]
