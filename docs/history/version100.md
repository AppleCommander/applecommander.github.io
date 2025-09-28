!!! info "Legacy"
    Older releases were from sourceforge and are considered legacy. Please use a more current release from [GitHub](https://github.com/AppleCommander/AppleCommander).

I am working on a general Apple2 disk image utility. Why? I haven't found any one utility that does everything for transferring files in and out of disk images - and, besides, I'm thoroughly enjoying _retro computing_.

Currently, it reads and displays the contents of disks. It supports DOS 3.3, ProDOS, Apple Pascal, and RDOS formatted disks - and reads compressed (`*.gz`) images, 140K DOS ordered (`*.do`, `*.dsk`), 140K ProDOS ordered (`*.po`), 800K ProDOS ordered (`*.2img`, `*.2mg`), and 32MB ApplePC hard disk images (`*.hdv`). This doesn't cover all image formats, but covers the ones I needed/wanted to have covered - it can be expanded relatively easily.

Future direction are to (a) have the ability to extract files from images and (b) to import files into images.

Two caveats - it is written in Java (you need the JVM installed to run it), and I also have been using this as an excuse to work with the Eclipse.org SWT windowing library (which will need to be downloaded also). However, the upside to this is that it should run wherever Java and SWT run (Windows, Linux, and Mac OS X right now).

If you're interested, come and take a peek!

        http://webpages.charter.net/greener/AppleCommander/
        (Note that this link is no longer active.)

-Rob
