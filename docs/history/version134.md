!!! info "Legacy"
    Older releases were from sourceforge and are considered legacy. Please use a more current release from [GitHub](https://github.com/AppleCommander/AppleCommander).

A new release of AppleCommander is available!

Version 1.3.4 adds support for Apple Pascal 800K images; OS X issues resolved; Pascal images are now writable; and some work towards internationalization has been done.

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

If you're interested, please take a peek and let me know what you think! Contributions are more than welcome. If anyone wants to create an engaging GUI, that would be a great addition. Any anything else you think should be in AppleCommander...

-Rob

New for version 1.3.4 (2007-03-31):

* Started using the SWT S-Leak application to test for application resource leakage.
* Reports of a few issues with 800K images. UniDOS in particular doesn't appear to be recognized appropriately. This was due to a mix-up in setting the the image ordering.
* Fixed the bug where the import of a binary file does not set the address for DOS images.
* Fixed bug that where a file could not be exported as raw binary. (Crashed AppleCommander.)
* Raw binary files may now be imported - just check the raw image checkbox in the import wizard.
* Prepare for internationalization (I18N). Started as a simplification process but it got carried away. Text is stored in text bundles throughout the code. The files end with `____Bundle.properties`. The groupings are Storage, Compiler, Ui, and Text; directories relate to the package. Contributions are more than welcome seeing as I know very little German and it's unlikely that I'll get my wife to spend time translating to Spanish.
* Updates per Eclipse 3.0 recommendations.
* Resolve OS X issues where window cannot come to the foreground. (J Matthews)
* Add Apple Pascal writing capability. (J Matthews)

[The End.]
