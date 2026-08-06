# BASIC Tools API

The BASIC Tools API is a set of reusable code that can be used to parse a text-based Applesoft BASIC program an generate the appropriate tokens.  It also has multiple types of visitors that can re-write that parse tree to rearrange the code (calling them optimizations is a bit over-the-top).

Additionally, it supports shape table manipulation.

## BASIC Tokenizer Overview

Generally, the usage pattern is:

1. Setup the `Configuration`.
2. Read the tokens. Token readers are: ModernTokenReader and ClassicTokenReader.
3. Parse the tokens into a `Program`.
4. Apply transformations, if applicable.

### Code snippets

```java
Queue<Token> tokens = ModernTokenReader.tokenize(config.sourceFile);
```

The list of tokens is a loose interpretation. It includes more of a compiler sense of tokens -- numbers, end of line markers (they're significant), AppleSoft tokens, strings, comments, identifiers, etc.

```java
Parser parser = new Parser(tokens);
Program program = parser.parse();
```

The `Program` is now the parsed version of the BASIC program.  Various `Visitor`s may be used to report, gather information, or manipulate the tree in various ways.

```java
Configuration config = Configuration.builder()
        .sourceFile(this.sourceFile)
        .build();
```

The `Configuration` class also allows the BASIC start address to be set (defaults to `0x801`), set the maximum line length (this is in bytes, and defaults to `255`, but feel free to experiment).  Some of the classes report output via the debug stream, which defaults to a simple null stream (no output) - replace with `System.out` or another `PrintStream`.

```java
ByteVisitor byteVisitor = Visitors.byteVisitor(config);
byte[] programData = byteVisitor.dump(program);
```

Finally, the ByteVisitor will transform the program into the tokenized form.

### Optimizations

Optimizations are mechanisms to rewrite the `Program`, typically making the program smaller. `Optimization` itself is an enum which has a `create` method to setup the `Visitor`.

Current optimizations are:

* _Remove empty statements_ will remove all extra colons.  For example, if the application in question used `:` to indicate nesting. Or just accidents!
* _Remove REM statements_ will remove all comments.
* _Extract constant values_ will find all constant numerical references, insert a line `0` with assignments, and finally replace all the numbers with the approrpiate variable name. Hypothesis is that the BASIC interpreter only parses the number once.
* _Merge lines_ will identify all lines that are not a target of `GOTO`/`GOSUB`-type action and rewrite the line by merging it with others.  The concept involved is that the BASIC program is just a linked list and shortening the list will shorten the search path.  The default *max length* in bytes is set to `255`. 
* _Renumber_ will renumber the application, beginning with line `0`. This makes the decoding a tiny bit more efficient in that the number to decode will be smaller in the token stream.

Sample use:

```java
program = program.accept(Optimization.REMOVE_REM_STATEMENTS.create(config));
```

## Shape Tooling

The Shape API allows:

* Shape tables to be read in the standard binary format;
* Shape tables to be generated from "source" in three formats;
* Shape tables to be written to the standard binary format;
* Shapes and shape tables can be written to a text or image graphical representation. 

### API Notes

The shape table is represented by the `ShapeTable` class which has static `read` methods.
To generate a shape table from "source" use the `ShapeGenerator` class.

The `ShapeTable` object holds a list of `Shape`s.  A `Shape` can be converted to a `VectorShape`
(up, down, left, right, plot/no plot) or to a `BitmapShape` with the `Shape#toVector()` and
`Shape#toBitmap()` methods.
