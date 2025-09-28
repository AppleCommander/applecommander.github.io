!!! info "Legacy"
    Older releases were from sourceforge and are considered legacy. Please use a more current release from [GitHub](https://github.com/AppleCommander/AppleCommander).

A new release of AppleCommander is available. Version 1.2.0 took a bit longer than expected, as I got distracted with other fun stuff in AppleCommander (hence, super-hires exports and AWP to RTF conversion):

* Can now create disk images. For the moment, these images are not bootable (including hard disk images) - they do however boot a nifty title screen...
* Files can now be imported into disks. Formats that support this are DOS 3.3 and ProDOS formats. (Pascal and RDOS will come at a later point.)
* The AppleWorks export now has an option for exporting to Rich-Text Format (RTF). This format can be loaded into many word-processors easily.
* The graphics export option now supports Super High-Res images. Both unpacked and packed formats. These are essentially raw dumps from the IIGS memory that were saved to disk.
* Files can be deleted.
* Any changes to a disk image can be saved. Please be careful! It's easy enough to keep a backup copy of your work these days.
* Two new DOS derivatives are available: UniDOS and OzDOS (both are 800K formats).

A Linux and a Windows native executable is in the works. Be warned that they are still experimental. In particular, in the process of compiling, something about the code introduces delays (i.e., click and wait a couple of seconds), and the graphics filter currently needs to be disabled, as GCJ does not support the graphics libraries that are being used.

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

If you're interested, please take a peek and let me know!

-Rob
