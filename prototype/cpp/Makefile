CC=${CONDA_PREFIX}/bin/clang
CXX=${CONDA_PREFIX}/bin/clang++
# CC=${CONDA_PREFIX}/bin/gcc
# CXX=${CONDA_PREFIX}/bin/g++

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
	cmake \
		-DCMAKE_INSTALL_PREFIX=${CONDA_PREFIX} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_COMPILER=${CC} \
		-DCMAKE_CXX_COMPILER=${CXX} \
		-GNinja \
		-S . \
		-B build \
		&& \
	cd build && \
	ninja


.PHONY: install
install:
	cd build && \
	ninja install


.PHONY: rebuild
rebuild: clean build


.PHONY: debug
debug:
	cmake \
		-DCMAKE_BUILD_TYPE=Debug \
		-GNinja \
		-S . \
		-B build\
		&& \
	cd build && \
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


.PHONY: clean_tests
clean_tests:
	cd tests && \
	rm -rf build/*


.PHONY: sanity_tests
sanity_tests: clean_tests # rebuild install
	cd tests && \
	export LD_LIBRARY_PATH=${CONDA_PREFIX}/lib:${LD_LIBRARY_PATH} && \
	cmake \
		-DCMAKE_INSTALL_PREFIX=${CONDA_PREFIX}/bin \
		-DCMAKE_C_COMPILER=${CC} \
		-DCMAKE_CXX_COMPILER=${CXX} \
		-Dfenix_DIR=${CONDA_PREFIX}/share/fenix/cmake \
		-S . \
		-B build \
		&& \
	cmake --build build && \
	cd build && \
	ctest
