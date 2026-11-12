# Internal Commands

The `COMMAND.COM` interpreter has a number of internal commands. These are documented in a `HELP.BAT` file that is written in Bulgarian.

| Command | Syntax | Description |
|---|---|---|
| `BREAK` | `BREAK=ON/OFF` | Turns the handling of Ctrl-C on or off. |
| `CD` | `CD [d:][\][path]` | Changes the current directory or drive. |
| `CLS` | `CLS` | Clears the screen. |
| `DATE` | `DATE [DD-MM-YYYY]` | Displays or sets the system date. |
| `DEL` | `DEL [d:][\][path\]file` | Deletes a file or files. Deleting `*.*` deletes all files on the disk, regardless of directory. |
| `DIR` | `DIR [d:][\][path\][file]` | Lists directory contents, optionally for a specified drive, path, or file. |
| `d:` | `d:` | Selects a drive. Example: `A:`. |
| `ECHO` | `ECHO ON/OFF/message` | Enables or disables the display of batch-file commands or displays the message. |
| `GOTO` | `GOTO:label` | Transfers execution to the named label in a batch file. |
| `IF` | `IF string1 string2 command` | Executes a command if `string1` and `string2` match. |
| `INPUT` | `INPUT` | Reads input from the user and assigns each string to a conditional variable (`%1`, `%2`, etc). Only available in `BAT` files. |
| `LOWER` | `LOWER` | Changes system text to lowercase. Allows commands to be entered in lowercase or uppercase. |
| `MAKE` | `MAKE [d:][\][path\]file` | Creates a file; all text entered until Ctrl-C pressed is written to the file. |
| `MD` | `MD [d:][\][path\]name` | Creates a directory. |
| `PATH` | `PATH [d:][path];[d:]...` | Sets the search path for commands that aren’t in the current directory. |
| `PAUSE` | `PAUSE` | Pauses batch-file execution and waits for a keypress. There is no prompting. |
| `PROMPT` | `PROMPT [prompt-format]` | Changes the command prompt. Special codes:<br/>`$B` = `;`;<br/>`$C` = newline;<br/>`$D` = system date;<br/>`$G` = `>`;<br/>`$H` = backspace;<br/>`$L` = `<`;<br/>`$N` = active drive;<br/>`$P` = active directory;<br/>`$S` = space;<br/>`$U` = move up;<br/>`$V` = US-DOS version;<br/>`$Z` = clear screen;<br/>`$$` = `$`;<br/>`$^` = bell.<br/>Default is `$C$N$G`. |
| `RD` | `RD [d:][\][path\]name` | Removes an empty directory. |
| `REN` | `REN [d:][path\]oldname newname` | Renames a file. |
| `TYPE` | `TYPE [d:][path\]file` | Displays a file’s contents. |
| `UPPER` | `UPPER` | Changes system text to uppercase. Commands must be entered in uppercase. |
| `VER` | `VER` | Displays the US-DOS version. |
| `VERIFY` | `VERIFY ON/OFF` | Turns verification on or off of information after it is written. Default is `ON`. |
| `VOL` | `VOL [d:]` | Displays the volume name for a drive. |
