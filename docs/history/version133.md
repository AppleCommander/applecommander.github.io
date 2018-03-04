A new release of AppleCommander is available!

Version 1.3.3 adds support for Apple Pascal .text files; also added support for Assembly source file viewing. Scrollbar increments are now sensible.

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

If you're interested, please take a peek and let me know what you think!

-Rob

New for version 1.3.3 (2004-06-18):

* Repackage code - packages were getting a bit large. The goal is to make class structure/placement more logical. GUI:
    - Moved the SWT wizards into their own packages;
    - Separated utility classes into the util package;
    - Main application windows remain in swt package.
* Storage:
    - Moved OS formats into their respective packages in the "os" package (`dos33`, `prodos`, `cpm`, `rdos`, `pascal`);
    - Filters are now in the filters package;
    - General storage classes remain under storage (`Disk`, `FormattedDisk`, etc).
* Added formatted assembly `FileFilter`. Understands Merlin format source files. Need to recognize various formats - `T.*`, `*.S`, etc. Need examples for other formats (Orca, APW, etc).
* File viewer window now scrolls an appropriate amount: PgUp/PgDn, arrows, mousewheel all work (must select content area first of course).
* Wizard windows no longer show up with the title bar off the screen.
* Refactored `FileViewerWindow`. Created supporting `FilterAdapter` classes as well as (presumably) reusable `ContentAdapters`. Started caching the filtered content for a little speed improvement when switching filters (native, hex, raw) in the `FileView`.
* Hans Otten provided information on Apple Pascal's formatting of `.text` files - they are now read correctly with appropriate character spacing and header section is ignored.
* Fixed error where viewing an invalid graphics file crashed AppleCommander (typically was too short). This can be done by context menu -> View As -> Graphics.
* Further automated build (and web site) deployment. Ant now builds source zip, GUI JAR, command-line jar, javadoc, and website. Website zip file only needs to be extracted into the web root to be deployed. Windows executable is scripted but not plugged into the Ant script at this time.

[The End.]
