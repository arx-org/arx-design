cmake_minimum_required(VERSION 3.0)
project(fenix-test)

get_filename_component(PARENT_DIR ../ ABSOLUTE)

# gtest:start

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake_modules")

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

# gtest:end

set(FENIX_TEST_DIR "${FENIX_ROOT}/tests/")
set(FENIX_TEST_SOURCES
    ${FENIX_TEST_DIR}/test_main.cpp
    ${FENIX_TEST_DIR}/test_types.cpp
)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR} ${PARENT_DIR}/include)

set(TEST_BASE_PATH "./tmp")
add_definitions("-DBASE_PATH=\"${TEST_BASE_PATH}\"")

# e.g.: add_executable(ResultTest ResultATest.cpp ResultB.cpp)
add_executable(test_fenix ${FENIX_TEST_SOURCES})

target_link_libraries(test_fenix gtest_main)

include(GoogleTest)

gtest_discover_tests(test_fenix)
