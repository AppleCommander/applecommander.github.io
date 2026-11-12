# External Commands

These are the commands on the "master" disk in the `DOS` subdirectory. Some of the command descriptions are guesses; there does not appear to be a way to get help such as `MAP /?`.

| Command Syntax | Description |
| :--- | :--- |
| `MAP [d:]` | Display a disk usage map. |
| `GRM35` | Enter a graphics mode of 35 characters in width. Supports the Bulgarian language and graphical box characters. |
| `TXM80` | Enters 80 column text mode. Appears to unintentionally turn on mouse text in Apple II's that have it. |
| `HELP [command|*]` | Displays information about internal commands. Original is written in Bulgarian; AppleCommander has an English translation. `HELP` along starts a multi-page display; `HELP *` lists all commands; `HELP command` display help about the specific command. |
| `COMP file1 file2` | Compares two files. |
| `PICTURE file` | Displays a highres picture. |
| `GRM70` | Enters a graphics mode of 70 characters in width. Supports the Bulgarian language and graphical box characters. |
| `UNDELETE file` | Undeletes a file. |
| `LABEL [d:]` | Set the disk label. |
| `IND` | ? |
| `CONFIG` | Display configuration. Specifically shows which drives are mapped to which letters. |
| N/A | This is the command interpreter. Must be present to boot a disk. Can be placed in any directory. |
| `FORMAT [d:]` | Formats the disk. Note that the initial boot sector does not load `COMMAND.COM`. See `SYS.COM` as well. |
| `TREE [d:]` | Displays a directory tree for the disk. |
| `SYS [d:]` | Writes a boot sector that can load `COMMAND.COM`. |
| `CATALOG` | Reads a DOS 3.3 disk catalog. |
| `TRANSFER file1 file2` | Transfers files from US-DOS (`file1`) to DOS 3.3 (`file2`). |
| `FIND file "text"$hex"text"..` | Find content in specified file. Displays offset where found. |
| `SCT /(d,e,n,s) [d:]` | ? |
| `EDLIN [file]` | Edits a file. Help is in Bulgarian. |
