cmake_minimum_required(VERSION 3.12)
project(hellocmake LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Note the sub-directory containing the dependent library 
add_subdirectory(fmt)

add_executable(hellocmake main.cpp)

# Link the dependent library to the target
target_link_libraries(hellocmake PUBLIC fmt)

# Post build step: create a symlink to the compile_commands.json
file(CREATE_LINK
    "${CMAKE_BINARY_DIR}/compile_commands.json"
    "${CMAKE_SOURCE_DIR}/compile_commands.json"
    SYMBOLIC
)
