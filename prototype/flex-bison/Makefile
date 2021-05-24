# LDFLAGS="-L${CONDA_PREFIX}/lib ${LDFLAGS}"
COMPILER=g++
CFLAGS= -g -Wall -Wno-unused -Wno-deprecated -Wno-write-strings -DDEBUG -v
CINCLUDE=-I `pwd` -I `pwd`/include

FLEX_FLAGS=--verbose --debug --outfile fenix.lex.yy.c
FLEX=flex ${FLEX_FLAGS}

# removed: --yacc --name-prefix fenix_yy
BISON_FLAGS=-d --verbose --file-prefix fenix --debug
BISON=bison ${BISON_FLAGS}

.PHONY: clean-parser
clean-parser:
	rm -f fenix.tab.*
	rm -f fenix.output


.PHONY: clean-lexer
clean-lexer:
	rm -f fenix.lex.yy.*


.PHONY: clean-build
clean-build:
	rm -f fenix

.PHONY: clean-all
clean-all: clean-parser clean-lexer clean-build


.PHONY: build-lexer
build-lexer: clean-lexer
	${FLEX} fenix.l


.PHONY: build-parser
build-parser: clean-parser
	${BISON} fenix.y

.PHONY: compile-parser
compile-parser: clean-all build-parser build-lexer
	$(COMPILER) ${CFLAGS} ${CINCLUDE} fenix.tab.c -lfl -o fenix


.PHONY: compile-lexer
compile-lexer: clean-all build-parser build-lexer
	$(COMPILER) ${CFLAGS} ${CINCLUDE} fenix.lex.yy.c -lfl -o fenix

.PHONY: compile-all
compile-all: clean-all build-parser build-lexer
	$(COMPILER) ${CFLAGS} ${CINCLUDE} fenix.tab.c fenix.lex.yy.c -lfl -o fenix


.PHONY: run-test
run-test:
	./fenix source.fnx


.PHONY: all
all: build-parser build-lexer combine-lexer-parser compile-source
