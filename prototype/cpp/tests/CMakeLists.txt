cmake_minimum_required(VERSION 3.14)
project(fenix_project_test
    DESCRIPTION "Fenix CPP tests."
    LANGUAGES CXX
)
set(CMAKE_CXX_STANDARD 17)

get_filename_component(PARENT_DIR ../ ABSOLUTE)

find_package (fenix REQUIRED)

set(FENIX_TEST_SOURCES
    ${PARENT_DIR}/tests/test_main.cpp
    ${PARENT_DIR}/tests/test_types.cpp
)

add_executable(test_fenix ${FENIX_TEST_SOURCES})

target_link_libraries(test_fenix fenix)

# =========
# gtest:start

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()
target_link_libraries(test_fenix gtest_main)
include(GoogleTest)
gtest_discover_tests(test_fenix)

# gtest:end
# =========
