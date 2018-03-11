AC_SRC = ../AppleCommander
SHK_SRC = ../ShrinkItArchive
JAVADOC = build/docs/javadoc
AC_DOC = ./docs/dev-notes/javadoc/AppleCommander
SHK_DOC = ./docs/dev-notes/javadoc/ShrinkItArchive

.PHONY: help javadoc

help:
	@echo
	@echo "Usage:"
	@echo "  javadoc   Generate javadoc for BOTH AppleCommander and ShrinkItArchive."
	@echo

javadoc:
	test -d ${AC_SRC}
	test -d ${SHK_SRC}
	(cd ${AC_SRC}; ./gradlew javadoc)
	(cd ${SHK_SRC}; ./gradlew javadoc)
	rm -rf ${AC_DOC}
	mkdir -p ${AC_DOC}
	cp -r ${AC_SRC}/${JAVADOC}/* ${AC_DOC}
	rm -rf ${SHK_DOC}
	mkdir -p ${SHK_DOC}
	cp -r ${SHK_SRC}/${JAVADOC}/* ${SHK_DOC}
