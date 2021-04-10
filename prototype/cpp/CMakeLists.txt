cmake_minimum_required(VERSION 3.0)
project(fenix)

get_filename_component(PARENT_DIR ./ ABSOLUTE)

# for debugging
# find_package (glog 0.4.0 REQUIRED)

include_directories(include)
file(GLOB SOURCES "src/*.cpp" "src/**/*.cpp")

# add_executable(fenix ${SOURCES})
add_library(
    fenix
    SHARED
    ${SOURCES}
)

set_property(TARGET fenix PROPERTY CXX_STANDARD 17)

# target_link_libraries(fenix glog::glog)
target_link_libraries(fenix)

# set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")
# set (CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")

# TODO: Run -Werror in CI.
# target_compile_options(fenix PRIVATE -Wall -Wextra)

set_target_properties(
    fenix PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${PARENT_DIR}/lib
)
