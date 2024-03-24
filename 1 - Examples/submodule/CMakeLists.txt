cmake_minimum_required(VERSION 3.21)
project(hellocmake LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(hellolib)

add_executable(hello_cmake main.cpp)

target_link_libraries(hello_cmake PUBLIC hellolib)

# Post build step: copy the executable to the root directory
add_custom_command(TARGET hello_cmake
                   POST_BUILD
                   COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:hello_cmake> ${CMAKE_SOURCE_DIR})

# Post build step: create a symlink to the compile_commands.json
file(CREATE_LINK
    "${CMAKE_BINARY_DIR}/compile_commands.json"
    "${CMAKE_SOURCE_DIR}/compile_commands.json"
    SYMBOLIC
)
