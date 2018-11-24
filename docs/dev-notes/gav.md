## AppleCommander

The AppleCommander libraries are available in the Maven repository:

```
<dependency>
 <groupId>net.sf.applecommander</groupId>
 <artifactId>AppleCommander</artifactId>
 <version>1.4.0</version>
</dependency>
```

> Note that as of 1.4.0, the Shrinkit library is a separate project and is in the `pom.xml`
> as a dependency.

## ShrinkItArchive

The Shrinkit libary is available as a separate dependency:

```
<dependency>
 <groupId>net.sf.applecommander</groupId>
 <artifactId>ShrinkItArchive</artifactId>
 <version>1.1.0</version>
</dependency>
```

## Final Notes
This is a manual release process, so it may take a bit of time (and possibly some prodding).

Notes:

* There are no plans to change from `net.sf.applecommander` in the GAV. (It should have been `com.webcodepro.applecommander`, however, that domain was given up long ago.)
* The Java packages will remain `com.webcodepro.applecommander` as everyone depends on that package scheme.
