# Dependencies

Much of AppleCommander and it's tooling should be reusable and can be included in other projects.

## AppleCommander

The AppleCommander libraries are available as a dependency.

Maven:

```
<dependency>
 <groupId>net.sf.applecommander</groupId>
 <artifactId>AppleCommander</artifactId>
 <version>1.10.1</version>
</dependency>
```

Gradle:

```
implementation 'net.sf.applecommander:AppleCommander:1.10.1'
```

> Note that as of 1.4.0, the Shrinkit library is now a separate project.

## Shrinkit

The Shrinkit library is available as a separate dependency.

Maven:

```
<dependency>
 <groupId>net.sf.applecommander</groupId>
 <artifactId>ShrinkItArchive</artifactId>
 <version>1.2.2</version>
</dependency>
```

Gradle:

```
implementation 'net.sf.applecommander:ShrinkItArchive:1.2.2'
```

## AppleSingle 

The AppleSingle support is available in a dedicated API.

Maven:

```
<dependency>
 <groupId>net.sf.applecommander</groupId>
 <artifactId>applesingle-api</artifactId>
 <version>1.2.2</version>
</dependency>
```
Gradle:

```
implementation 'net.sf.applecommander:applesingle-api:1.2.2'
```

## BASIC 

The BASIC tooling is available in the bastools API.

Maven:

```
<dependency>
 <groupId>net.sf.applecommander</groupId>
 <artifactId>bastools-api</artifactId>
 <version>0.4.0</version>
</dependency>
```

Gradle:

```
implementation 'net.sf.applecommander:bastools-api:0.4.0'
```

## AppleCommander disassembler

The AppleCommander disassembler tooling is available in the acdasm API.

Maven:

```
<dependency>
    <groupId>net.sf.applecommander</groupId>
    <artifactId>acdasm</artifactId>
    <version>0.5.0</version>
</dependency>
```

Gradle:

```
implementation 'net.sf.applecommander:acdasm:0.5.0'
```

## Final Notes
This is a manual release process, so it may take a bit of time (and possibly some prodding).

Notes:

* There are no plans to change from `net.sf.applecommander` in the GAV. (It should have been `com.webcodepro.applecommander`, however, that domain was given up long ago.)
* The Java packages will remain `com.webcodepro.applecommander` as everyone depends on that package scheme.
* The versions listed here are modified by hand, so don't hesitate to check them. Note that the version should match was is in the GitHub release page for each of the subprojects.
