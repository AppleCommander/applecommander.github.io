A new release of AppleCommander is available!

Version 1.3.2 adds support for the nibble disk image order as well as support for read-only CP/M disks. SHR 3200-color graphics capability also.

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

If you're interested, please take a peek and let me know what you think!

-Rob

New for version 1.3.2 (2004-06-05):

* Print file listing or full disk listing (including subdirectories or multiple volumes).
* Added support for Super Hi-Res 3200 color format (PIC of 38400 bytes, file type $C1 and auxiliary type $0002).
* Updated preferences to remember the following directory locations:
    - Open
    - Save/Save As (new)
    - Import (new)
    - Export
    - Compile
* Added support for Finder Icons File ($CA or "ICN").
* Added CP/M disk image support.
* Restructured how AppleCommander manages disk ordering. This simplifies the manner in which various disk ordering schemes are implemented, and makes it possible to translate between ordering schemes.
* Support for nibble images (`*.NIB`) added. Can read and write to the images as long as that format supports writing.
* To support nibble images, changed the structure surrounding the disk image for a Disk. There now is an `ImageOrder` which manages the ordering of data on the image and supplies low-level read and write routines (track/sector and block). An `ImageOrder` holds data in an image layout - this allows the generic byte array and 2IMG layouts to be abstracted away from an images order. This does add interaction complexity but actually simplified the Disk class.
* Viewing or double-clicking on a directory will navigate into that directory.
* Viewing a deleted file no longer crashes AppleCommander - a warning message is displayed.
* Updated Export Graphics wizard and export right-click options.
* Add the ability to change physical order too (DOS <=> ProDOS <=> Nibble) on 140KB images.
* Add ability to compare disks - regardless of physical order.
* Started using Gimp for images (instead of Microsoft Photo Draw 2).
* Added a "View As" menu pick in context menu. (Just Text or Graphics at this time.)

[The End.]
