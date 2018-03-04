# applecommander.github.io

This site has moved to using the [Material theme](https://squidfunk.github.io/mkdocs-material/) of [MkDocs](http://www.mkdocs.org/).

## Setup

Generally follow their directions to get setup, but what was needed on Ubuntu Linux is only:

```
$ sudo apt-get install python-pip
$ pip install mkdocs-material
```

## Developing

`cd` to the `applecommander.github.io` working directory and:

```
$ mkdocs serve
```

Open a browser to http://localhost:8000/ and the site will be there and can be live-edited.

Please note that the Javadoc section (`docs/dev-notes/javadoc/`) gives MkDocs fits, but it appears that the complaining can be safely ignored.

## Publishing

To publish, per [Deploying your docs](http://www.mkdocs.org/user-guide/deploying-your-docs/), the following will build and commit to the `gh-deploy` branch:

```
$ mkdocs gh-deploy
```

## Resources

* [Material theme](https://squidfunk.github.io/mkdocs-material/)
* [MkDocs](http://www.mkdocs.org/)
