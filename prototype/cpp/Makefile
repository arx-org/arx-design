CC=${CONDA_PREFIX}/bin/clang
CXX=${CONDA_PREFIX}/bin/clang++

SHELL := /bin/bash
MAKEFILE_DIR = $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
FENIX_ROOT := ${MAKEFILE_DIR}

.PHONY: all
all: clean format test build run build-and-run debug-and-run


.PHONY: clean
clean:
	rm -rf build/*


.PHONY: format
format:
	clang-format cpp/* cpp/**/* -i


.PHONY: build
build:
	mkdir -p build && \
	cd build && \
	cmake -DCMAKE_BUILD_TYPE=Release -GNinja .. && \
	ninja


.PHONY: rebuild
rebuild: clean build


.PHONY: debug
debug:
	mkdir -p build
	cd build && \
	cmake -DCMAKE_BUILD_TYPE=Debug -GNinja .. && \
	ninja


.PHONY: run
run:
	cd build && \
	./fenix


.PHONY: build-and-run
build-and-run: build run


.PHONY: rebuild-and-run
rebuild-and-run: rebuild run


.PHONY: rebuild-and-debug
rebuild-and-debug: clean debug
	cd build && \
	gdb ./fenix


.PHONY: sanity_tests
sanity_tests: rebuild
	export LD_LIBRARY_PATH=lib/:${LD_LIBRARY_PATH} && \
	cd tests && \
	rm -rf build && \
	mkdir -p build && \
	cd build && \
	cmake -DENABLE_ASAN=on -GNinja -DFENIX_ROOT=${FENIX_ROOT} .. && \
	ninja && \
	export ASAN_OPTIONS=alloc_dealloc_mismatch=0:handle_segv=0 && \
	ctest
