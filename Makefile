AC_SRC = ../AppleCommander
SHK_SRC = ../ShrinkItArchive
BT_SRC = ../bastools
AS_SRC = ../applesingle
DASM_SRC = ../acdasm
JAVADOC = build/docs/javadoc
AC_DOC = ./docs/dev-notes/javadoc/AppleCommander
SHK_DOC = ./docs/dev-notes/javadoc/ShrinkItArchive
BT_DOC = ./docs/dev-notes/javadoc/bastools
AS_DOC = ./docs/dev-notes/javadoc/applesingle
DASM_DOC = ./docs/dev-notes/javadoc/acdasm

.PHONY: help javadoc AppleCommander ShrinkItArchive bastools applesingle acdasm

help:
	@echo
	@echo "Usage:"
	@echo "  javadoc            Generate javadoc for ALL subprojects."
	@echo "  AppleCommander     Generate javadoc for just AppleCommander."
	@echo "  ShrinkItArchive    Generate javadoc for just ShrinkItArchive."
	@echo "  bastools           Generate javadoc for just bastools."
	@echo "  applesingle        Generate javadoc for just applesingle."
	@echo "  acdasm             Generate javadoc for just acdasm."
	@echo

javadoc: AppleCommander ShrinkItArchive bastools applesingle acdasm

AppleCommander:
	test -d ${AC_SRC}
	(cd ${AC_SRC}; ./gradlew javadoc)
	rm -rf ${AC_DOC}
	mkdir -p ${AC_DOC}
	cp -r ${AC_SRC}/lib/ac-api/${JAVADOC}/* ${AC_DOC}

ShrinkItArchive:
	test -d ${SHK_SRC}
	(cd ${SHK_SRC}; ./gradlew javadoc)
	rm -rf ${SHK_DOC}
	mkdir -p ${SHK_DOC}
	cp -r ${SHK_SRC}/${JAVADOC}/* ${SHK_DOC}

bastools:
	test -d ${BT_SRC}
	(cd ${BT_SRC}; ./gradlew javadoc)
	rm -rf ${BT_DOC}
	mkdir -p ${BT_DOC}
	cp -r ${BT_SRC}/api/${JAVADOC}/* ${BT_DOC}

applesingle:
	test -d ${AS_SRC}
	(cd ${AS_SRC}; ./gradlew javadoc)
	rm -rf ${AS_DOC}
	mkdir -p ${AS_DOC}
	cp -r ${AS_SRC}/api/${JAVADOC}/* ${AS_DOC}

acdasm:
	test -d ${DASM_SRC}
	(cd ${DASM_SRC}; ./gradlew javadoc)
	rm -rf ${DASM_DOC}
	mkdir -p ${DASM_DOC}
	cp -r ${DASM_SRC}/api/${JAVADOC}/* ${DASM_DOC}
