AC_SRC = ../AppleCommander
SHK_SRC = ../ShrinkItArchive
BT_SRC = ../bastools
AS_SRC = ../applesingle
JAVADOC = build/docs/javadoc
AC_DOC = ./docs/dev-notes/javadoc/AppleCommander
SHK_DOC = ./docs/dev-notes/javadoc/ShrinkItArchive
BT_DOC = ./docs/dev-notes/javadoc/bastools
AS_DOC = ./docs/dev-notes/javadoc/applesingle

.PHONY: help javadoc

help:
	@echo
	@echo "Usage:"
	@echo "  javadoc   Generate javadoc for BOTH AppleCommander and ShrinkItArchive."
	@echo

javadoc:
	test -d ${AC_SRC}
	test -d ${SHK_SRC}
	test -d ${BT_SRC}
	test -d ${AS_SRC}
	(cd ${AC_SRC}; ./gradlew javadoc)
	(cd ${SHK_SRC}; ./gradlew javadoc)
	(cd ${BT_SRC}; ./gradlew javadoc)
	(cd ${AS_SRC}; ./gradlew javadoc)
	rm -rf ${AC_DOC}
	mkdir -p ${AC_DOC}
	cp -r ${AC_SRC}/${JAVADOC}/* ${AC_DOC}
	rm -rf ${SHK_DOC}
	mkdir -p ${SHK_DOC}
	cp -r ${SHK_SRC}/${JAVADOC}/* ${SHK_DOC}
	rm -rf ${BT_DOC}
	mkdir -p ${BT_DOC}
	cp -r ${BT_SRC}/api/${JAVADOC}/* ${BT_DOC}
	rm -rf ${AS_DOC}
	mkdir -p ${AS_DOC}
	cp -r ${AS_SRC}/api/${JAVADOC}/* ${AS_DOC}
	
