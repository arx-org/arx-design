# LDFLAGS="-L${CONDA_PREFIX}/lib ${LDFLAGS}"
COMPILER=g++
CFLAGS= -g -Wall -Wno-unused -Wno-write-strings -v


.PHONY: build-clean
build-clean:
	rm -f fenix.lex.yy.c
	rm -f fenix.tab.c
	rm -f fenix


.PHONY: build-lexer
build-lexer:
	rm -f fenix.lex.yy.cc fenix.lex.yy.c
	flex --verbose --outfile fenix.lex.yy.cc fenix.l


.PHONY: build-parser
build-parser:
	rm -f fenix.tab.c fenix.tab.cc
	# TODO use c++
	# bison --language c++ fenix.y
	bison fenix.y


.PHONY: compile-lexer-parser
compile-lexer-parser: build-clean build-lexer
	$(COMPILER) ${CFLAGS} -I include fenix.lex.yy.cc -lfl -o fenix


.PHONY: test-lexer
test-lexer:
	cat source.fnx | ./fenix


.PHONY: all
all: build-parser build-lexer combine-lexer-parser compile-source
