!!! info "Legacy"
    Older releases were from sourceforge and are considered legacy. Please use a more current release from [GitHub](https://github.com/AppleCommander/AppleCommander).

A new release of AppleCommander is available! Version 1.2.2 continues on the general cleanup. One new export filter of a generalized hex dump has been added and quite a bit of work in relation to ProDOS volumes.

* ProDOS disks now re-use deleted file entries. Prior to this fix, deleted entries were never re-used. If importing many files, a "Disk Full" error would be generated rather quickly.
* ProDOS file entries do not generate spurious file entries. There was no method of detecting unused entries in pre-1.2.2 code.
* Import file specification should only allow address editing if the filetype requires it.
* Fixed parsing of filetype definitions for ProDOS volumes.
* Need to be able to import into a directory in ProDOS. This will most likely involve adding an interface indicating a (writable) directory. This interface would be applied to both disks as well as file entries, if appropriate.
* ProDOS subdirectories need to allocate another block as they fill up; otherwise the directory is limited to the number of entries that fit within the allocated space.
* Import now sports a progress indicator and identifies which file is being imported.
* Popup dialogs are now centered above the controlling window instead of popping up randomly.
* Added a Hex Dump file filter that displays offset into file, hex bytes, and the ASCII code.
* AppleCommander is now being built by an ANT script instead of by the Eclipse menu pick.

I'm still putzing with a compiled version for Linux and Windows, so they haven't shown up as of yet. (Unchanged - but not forgotten.)

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

If you're interested, please take a peek and let me know what you think!

-Rob
