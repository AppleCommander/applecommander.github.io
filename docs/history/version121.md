A new release of AppleCommander is available. Version 1.2.1 is primarily a clean-up operation. However, there is a bit of new functionality - AppleWorks Spread Sheet (ASP) and Data Base (ADB) files can both be exported to a `*.csv` file format.

* Now carries margin setting through, sets font to Courier New (more realistic formatting), and fixes boldface not being turned off correctly when converting AWP files to RTF format.
* Import could/should choose the filetype based upon the file extension for files being imported. Mostly useful for ProDOS; unless a filetype mapping is introduced.
* Export of AppleWorks Data Base files.
* Export of AppleWorks Spread Sheet files.
* Fixed minor issue with ProDOS disks where files at the 128K border would be grown (incorrectly) into a Tree file (instead of a Sapling).
* Import of multiple files fails after multiple imports. This was an issue with ProDOS files >128K ("Tree" files). The delete code didn't handle the master index block appropriately when blocks numbered zero were present (normally indicating the end of file).
* DOS 3.3 was not writing correct number of sectors if a file was more than 256 sectors long.
* DOS 3.3 was not managing deleted file entries appropriately and tried to work with track $FF.
* Fixed offset calculation for 800K DOS organized disks. This primarily affected UniDOS.
* Import menu should be in directory pane instead of file pane.
* The information tab does not get updated. Now that the disk can be modified, this page needs to be updated when shown.

I'm still putzing with a compiled version for Linux and Windows, so they haven't shown up as of yet.

AppleCommander is hosted on SourceForge. The home page is located at:

    http://applecommander.sourceforge.net/

The SourceForge project page is located at:

    http://sourceforge.net/projects/applecommander/

The files are located at:

    http://sourceforge.net/project/showfiles.php?group_id=67414

If you're interested, please take a peek and let me know!

-Rob
