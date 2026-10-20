# Dependencies

Much of AppleCommander and it's tooling should be reusable and can be included in other projects.

The AppleCommander libraries are available as a dependency.

=== "AppleCommander (12.0 or later)"
    Maven:

    ```xml
    <dependency>
        <groupId>org.applecommander</groupId>
        <artifactId>AppleCommander</artifactId>
        <version>15.1</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'org.applecommander:AppleCommander:15.1'
    ```

=== "AppleCommander (before 12.0)"
    Maven:

    ```xml
    <dependency>
        <groupId>net.sf.applecommander</groupId>
        <artifactId>AppleCommander</artifactId>
        <version>1.10.1</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'net.sf.applecommander:AppleCommander:1.10.1'
    ```

## Shrinkit

The Shrinkit library is available as a separate dependency.

=== "ShrinkItArchive (2.0 or later)"
    Maven:

    ```xml
    <dependency>
        <groupId>org.applecommander</groupId>
        <artifactId>ShrinkItArchive</artifactId>
        <version>2.4</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'org.applecommander:ShrinkItArchive:2.4'
    ```

=== "ShrinkItArchive (before 2.0)"
    Maven:

    ```xml
    <dependency>
        <groupId>net.sf.applecommander</groupId>
        <artifactId>ShrinkItArchive</artifactId>
        <version>1.2.2</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'net.sf.applecommander:ShrinkItArchive:1.2.2'
    ```

## AppleSingle 

The AppleSingle support is available in a dedicated API.

=== "AppleSingle (2.0 or later)"
    Maven:

    ```xml
    <dependency>
        <groupId>org.applecommander</groupId>
        <artifactId>applesingle-api</artifactId>
        <version>2.1</version>
    </dependency>
    ```
    Gradle:

    ```groovy
    implementation 'org.applecommander:applesingle-api:2.1'
    ```

=== "AppleSingle (before 2.0)"
    Maven:

    ```xml
    <dependency>
        <groupId>net.sf.applecommander</groupId>
        <artifactId>applesingle-api</artifactId>
        <version>1.2.2</version>
    </dependency>
    ```
    Gradle:

    ```groovy
    implementation 'net.sf.applecommander:applesingle-api:1.2.2'
    ```

## BASIC / Shape tables

The BASIC tooling is available in the bastools API.

=== "bastools (5.0 or later)"
    Maven:

    ```xml
    <dependency>
        <groupId>org.applecommander</groupId>
        <artifactId>bastools-api</artifactId>
        <version>5.3</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation "org.applecommander:bastools-api:5.3"
    ```

=== "bastools (before 5.0)"
    Maven:

    ```xml
    <dependency>
        <groupId>net.sf.applecommander</groupId>
        <artifactId>bastools-api</artifactId>
        <version>0.4.1</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'net.sf.applecommander:bastools-api:0.4.1'
    ```

## Disassembler

The AppleCommander disassembler tooling is available in the acdasm API.

=== "acdasm (6.0 or later)"
    Maven:

    ```xml
    <dependency>
        <groupId>org.applecommander</groupId>
        <artifactId>acdasm</artifactId>
        <version>6.3</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'org.applecommander:acdasm:6.3'
    ```

=== "acdasm (before 6.0)"
    Maven:

    ```xml
    <dependency>
        <groupId>net.sf.applecommander</groupId>
        <artifactId>acdasm</artifactId>
        <version>0.5.0</version>
    </dependency>
    ```

    Gradle:

    ```groovy
    implementation 'net.sf.applecommander:acdasm:0.5.0'
    ```

## Final Notes

Most of this is now an automated release, but there is a manual step at the end. If it doesn't show up, please drop a ticket for the publishing.

Notes:

* The versions listed here are updated manually, so please lookup the latest release. Note that the Maven version should match what is in the GitHub release page for each of the subprojects.
