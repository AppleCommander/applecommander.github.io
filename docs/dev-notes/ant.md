The distribution file `AppleCommander-version-ac.jar` provides an Ant task that can be used as part of Ant-based builds.

## Using the Apple Commander Ant task

The AppleCommander Ant task mirrors the `ac` command line as much as possible. The advantage over using the ant task over simply calling the AppleCommander command line directly is speed. It is much faster to call on the Ant task than it is for ant to shell out to the system, fire up a Java instance, and then execute your command.
As with any external ant task, the first thing that must be done is to declare a `taskdef`:

```
<taskdef name="appleCommander"
         classname="com.webcodepro.applecommander.ui.AntTask"
         classpath="AppleCommander-ac-${version}.jar"/>
```

Where `${version}` would need to be defined by you to be the version of the command-line AppleCommander you are using. The first version of the AC command line that included this Ant task support is 1.3.5.13.

Once you have the `taskdef` defined, it can be called from within ant like this:

```
<!-- Call AppleCommander to print information about the disk image -->
<appleCommander command="i" imagename="${myDiskImage}" />
```

The values for command that the ant task understands generally mirror those of the command line. Here's a list of them, along with their required and optional parameters:

```
i  <imagename> display information about an image.
ls <imagename> list brief directory of an image.
l  <imagename> list directory of an image.
ll <imagename> list detailed directory of an image.
e  <imagename> <filename> [<output>] export file from image to stdout or to an output file.
x  <imagename> [<outputpath>] extract all files from image to outputpath, or the current working directory if blank.
g  <imagename> <filename> [<output>] get raw file from image to stdout or to an output file.
p  <imagename> <filename> <type> [[$|0x]<addr>] put stdin in filename on image, using file type and address [0x2000].
d  <imagename> <filename> delete file from image.
k  <imagename> <filename> lock file on image.
u  <imagename> <filename> unlock file on image.
n  <imagename> <volname> change volume name (ProDOS or Pascal).
dos <imagename> <filename> <type> put stdin with DOS header in filename on image, using file type and address from header.
as <imagename> [<filename>] put stdin with AppleSingle format on image.
dos140 <imagename> create a 140K DOS 3.3 image.
pro140 <imagename> <volname> create a 140K ProDOS image.
pro800 <imagename> <volname> create an 800K ProDOS image.
pas140 <imagename> <volname> create a 140K Pascal image.
pas800 <imagename> <volname> create an 800K Pascal image.
convert <filename> <imagename> [<sizeblocks>] uncompress a ShrinkIt or Binary II file; or convert a DiskCopy 4.2 image into a ProDOS disk image.
```

For the commands that require a type parameter, their values depend on the operating system of the underlying image's operating system:

```
DOS 3.x: A, B, I, T, S, R, a, b.
Pascal: bad, code, text, info, data, graf, foto.
ProDOS: bas, bin, sys, txt, rel, etc.; see ProdosFileTypes.properties for more.
```

In order to feed AppleCommander standard input, a file would be specified with the input parameter for the task - like this:

```
<appleCommander command="p"
                input="manifest.mf"
                imagename="${myDiskImage}"
                filename="MANIFEST"
                type="T" />
```

In order to extract a file from an image to a real file, the real file would be specified with the output parameter for the task - like this:

```
<appleCommander command="g"
                imagename="${myDiskImage}"
                filename="MANIFEST"
                output="manifest.mf" />
```

AppleCommander ant tasks can be told to ignore errors with the `failonerror` parameter:

```
<appleCommander command="p"
                failonerror="false"
                input="${hugeFileExpectFailure}"
                imagename="${pro800image}"
                filename="BLOWUP"
                type="txt" />
```
