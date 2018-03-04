# applecommander.github.io

This site has moved to using the [Material theme](https://squidfunk.github.io/mkdocs-material/) of [MkDocs](http://www.mkdocs.org/).

## Setup

Generally follow their directions to get setup, but what was needed on Ubuntu Linux is only:

```bash
$ sudo apt-get install python-pip
$ pip install mkdocs-material
```

## Developing

Git clone the site.  Note that the branch `working-copy` is the primary branch to use.  Since the `applecommander.github.io` is an organization page, content must be pushed on the `master` branch.

`cd` to the `applecommander.github.io` working directory and:

```bash
$ mkdocs serve
```

Open a browser to http://localhost:8000/ and the site will be there and can be live-edited.

Please note that the Javadoc section (`docs/dev-notes/javadoc/`) gives MkDocs fits, but it appears that the complaining can be safely ignored.

## Publishing

To publish, per [Deploying your docs](http://www.mkdocs.org/user-guide/deploying-your-docs/), the following will build and commit to the `master` branch (again, make all changes against the `working-copy` branch):

```bash
$ mkdocs gh-deploy
```

The `mkdocs.yml` file has been configured to publish to `master`:

```yml
# Repository
remote_branch: master
```

## Resources

* [Material theme](https://squidfunk.github.io/mkdocs-material/)
* [MkDocs](http://www.mkdocs.org/)
