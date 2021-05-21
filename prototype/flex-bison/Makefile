# LDFLAGS="-L${CONDA_PREFIX}/lib ${LDFLAGS}"
CC=gcc
CXX=g++


.PHONY: build-parser
build-parser:
	bison parser.y

.PHONY: build-lexer
build-lexer:
	rm -f fenix.lex.yy.c
	flex --verbose --outfile fenix.lex.yy.c fenix.lex


.PHONY: compile-lexer-parser
compile-lexer-parser: build-lexer
	$(CC) fenix.lex.yy.c -lfl -v -o fenix


.PHONY: compile-source
compile-source:
	cat source.fnx | ./fenix


.PHONY: all
all: build-parser build-lexer combine-lexer-parser compile-source
