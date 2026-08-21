AppleCommander has a number of command-line tools, so these instructions are somewhat generic in nature.

!!! important
    Some of the suggested CLI names may conflict with existing commands on your computer. If they do, simply use a different name.
    None of the tools depend on being named in a particular manner. Specifically `ac` already exists in the Mac world. If you do keep 
    it as `ac`, you will effectively hide the existing tool.

The tools are:

| Tool | Description | Releases page |
| :--- | :--- | :--- |
| `ac` | The original AppleCommander CLI (by John Matthews) | [AppleCommander releases](https://github.com/AppleCommander/AppleCommander/releases) |
| `acx` | The reimagined/modern AppleCommander CLI. | [AppleCommander releases](https://github.com/AppleCommander/AppleCommander/releases) |
| `bt` | BASIC tools for tokenizing Applesoft programs. | [bastools project releases](https://github.com/AppleCommander/bastools/releases) |
| `st` | Shape Table tools for managing shape tables. | [bastools project releases](https://github.com/AppleCommander/bastools/releases) |
| `asu` | AppleSingle Utility for managing AppleSingle files. | [applesingle project releases](https://github.com/AppleCommander/applesingle/releases) |
| `acdasm` | AppleCommander disassembler. | [acdasm project releases](https://github.com/AppleCommander/acdasm/releases) |

!!! info
    The specialized tools typically offer more features than either `ac` or `acx` do. If the base AppleCommander tools cannot _quite_ do what
    you need, feel free to explore the other tools!

## Installation of a native executable

Many of these tools are now compiled. The benefit is obvious -- no Java installation required!  The primary risk is that the dynamicism of Java makes it possible components were dropped. There is tooling in the build pipeline to check, but all pathways need to be checked and it may get out of sync. **If you find something that crashes, please open a ticket so it can get fixed!**

General directions:

1. Download the approriate binary. They will have the operating system (darwin/mac, windows, linux) and processor (x86_64/amd64 or arm64/aarch64) in the file name.
2. Some of the binaries may be compressed (zip or tar file). Extract the binary if it is compressed.
3. Rename the tool to the name you want to use. For instance: `mv ac-linux-amd64-14.0 ac`.
4. On Linux and Mac, make the tool executable: `chmod +x <filename>`.
5. Place the binary where you like. Mac/Linux likely want it in `/usr/local/bin`. Be certain the command path is updated.

## Installation of the Java JAR

Once Java is installed all tools are in JAR form and are cross-platform. Thus, each tool will have one JAR file for download.

Please refer to the [original](original.md) directions for download. Adjust as necessary for the tool being installed. Note that Java is a one-time install (except if a newer version is required), so once installed all the JAR tools can be setup.
