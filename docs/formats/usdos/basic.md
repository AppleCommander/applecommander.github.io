# US-DOS `BASIC.COM`

`BASIC.COM` apears to be a command-interpreter for Applesoft. It appears to be rather complete and many of the components mirror what was avaliable in DOS. This is an attempt to capture the capabilities.

Common parameters:
* `dname` is a directory name.
* `fname` is a fully-qualified file name (including extension).
* `address` is an address which can be specified similar to DOS `A768` for decimal or `A$300` for hexidecimal.
* `length` is the length of a program, which can also be specified in decimal or hexidecimal.
* If there are multiple parameters, use a comma (`,`) to separate parameters.

| Command | Description |
| :--- | :--- |
| `SYSTEM` | Leaves Applesoft and returns to the `COMMAND.COM` interpreter. |
| `DIR` | Directory listing of current directory. Does not appear to allow paramters. |
| `CATALOG` | Same as `DIR`. Likely provided for compatability. |
| `MON` \[ `C`, `I`, `O` \] | Same as DOS `MON`. Causes display of disk commands (`C`), input from the disk (`I`), and output to the disk (`O`). |
| `NOMON` \[ `C`, `I`, `O` \] | Same as DOS `NOMON`. Cancels display of disk commands (`C`), input from the disk (`I`), and output to the disk (`O`). |
| `MODE` \[ `40` \] | Unknown. `MS-DOS` did have a `MODE` command for configuring devices. `MODE 40` blanks the screen but locks up the computer. |
| `CHDIR` dname | Change directory to the given directory name. There does not appear to be a short-cut `CD` command. Use `\` to get to the root directory for the disk. |
| `RMDIR` dname | Remove an empty directory. |
| `MKDIR` dname | Make a directory. |
| `RENAME` fname1 `,` fname2 | Rename `fname1` to be `fname2`. |
| `VERIFY` fname | Verify `fname` is stored on disk correctly. |
| `DELETE` fname | Delete `fname` from disk. |
| `BLOAD` fname \[ `A` address \] | Load a binary program from disk. |
| `BSAVE` fname `A` address `,` `L` length | Save binary program to disk. Automatically names it `.BIN` if no extension given. |
| `BRUN` fname \[ `A` address \] | Run a binary program from disk. Note that `BIN` files can be executed without the file extension. |
| `LOAD` fname | Load an Applesoft program. The `.BAS` extension is assumed. |
| `SAVE` fname | Save an Applesoft program. The `.BAS` extension is automatically assigned. |
| `RUN` fname | Run an Applesoft program. The `.BAS` extension is assumed. |
| `MAXFILES` n | (Not tested.) Reserves enough space to support `n` open files. |
| `OPEN` fname \[ `L` n \] | Open text file for reading. If the `L` parameter is used, uses that as the record length. |
| `CLOSE` \[ fname \] | Closes the open file. If `fname` not given, all files are closed. |
| `WRITE` fname \[ `R` n \] | Writes to text file. If the `R` parameter is given, positions on that record. |
| `BOOT` | Reboot. |
| `READ` fname \[ `R` n \] | Reads from a text file. If the `R` parameter is given, reads from that record. |
| `PR#` slot | Sends output to slot. If the slot contains a disk controller, reboots. |
| `IN#` slot | Takes input from slot. If the slot contains a disk controller, reboots. |
| `POSITION` fname `,` `R` n | Positions on the nth record. |
| `TYPE` fname | Display the contents of text file on screen. Assumes the `.TXT` extension. |
| `APPEND` fname | Opens sequential text file and prepares to write at the end of the file. |
| `EXEC` fname | Runs commands stored in text file. Assumes `.TXT` file extension. |
