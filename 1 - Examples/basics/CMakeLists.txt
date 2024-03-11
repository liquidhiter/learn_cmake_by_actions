# declear the minimum version requirement of the CMake
cmake_minimum_required(VERSION 3.1)

# How to add comments in a CMake file
# single line comments can be added by adding `#`
# multiple line comments can be added by using `#[[]]`
#[[add comments across multiple lines
like what is being written to these lines]]

# cmake_minimum_required(VERSION x.x)
# - VERSION is the keyword
# - CMake version determines the policies (features-ish?)
# - version numbers can be defined as a range
cmake_minimum_required(VERSION 3.7...3.21)

# What the following code block does:
# 1> check whether the active cmake version is larger than 3.12
# 2> if yes, set the cmake_policy only to 3.12
#!NOTE: back-ward compatibility e.x. 3.7?
if (${CMAKE_VERSION} VERSION_GREATER 3.12)
    # cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
    # cmake_policy(VERSION 3.12)
    message(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

# All top-level CMakeLists.txt must contain the following line
project(CMakeDemo   VERSION 1.0
                    DESCRIPTION "Demo the use of CMake" # support whitespaces in the string, e.x. surronded by ""
                    LANGUAGES CXX)

# Generate a simple executable
#!NOTE: demo is the name of the CMake executable and also the target
#       CMake only compiles the source file, and header files are usually ignored
#TODO       listing header files to ensure they will be considered by the IDE ???
add_executable(demo demo.cpp dep.h)

# Generate a static library
# type of libraries: STATIC, SHARED or MODULE, which is known to CMake by checking `BUILD_SHARED_LIBS` by default
add_library(demo_lib
            STATIC 
            demo.cpp
            dep.h)

# Create a virtual object (dummy???)
# something that doesn't need to be compiled, such as a header file only
# which is usually called `INTERFACE`
add_library(demo_interface
            INTERFACE)

# ALIAS library ???
# Specific syntax: `::`
# TODO

# Add information to the target ?
# PUBLIC means that all objects linking to this object must include the folder
# PRIVATE only impacts the current object, not the dependency
# INTERFACE only impacts the dependency
target_include_directories(demo PUBLIC include)

add_library(demo_lib_2 STATIC fun.cpp dep.h)
target_link_libraries(demo_lib_2 PUBLIC demo_lib)

# Declare a variable and initialize it with some value
# NOTE: variables have their own scope in CMake
set(TEST_EN "true")

# Create a list, "one two" <=> "one" "two"
set(MY_LIST "one two")
# Get the length of the list
list(LENGTH MY_LIST len)
message(STATUS "len = ${len}")

# Print the variable and the list value\
#!NOTE: when the variable stores a path, add qutations, "${PATH}"
message(STATUS ${TEST_EN})
message(STATUS ${MY_LIST})

# Separate a list with white spaces
separate_arguments(MY_LIST)
list(LENGTH MY_LIST len)
# length has been changed here
message(STATUS "len = ${len}")
message(STATUS ${MY_LIST})

# Cache variable
# Main difference between normal and cache variables
# CACHE ones turn up in the cmake config tool as setting you can set
# reference: https://stackoverflow.com/questions/36097090/what-does-cache-string-in-cmake-cmakelists-file-mean
set(MY_CACHE_VARIABLE "Cached value" CACHE STRING "This is displayed as one of the settings that user can configure!")


# Create a temporarily-used global variable
# `FORCE` Set the value of the variable
set(MY_CACHE_VARIABLE_G "MY_CACHE_VARIABLE_G" CACHE STRING "" FORCE)
# Not list this CACHE variable as one of the settings
mark_as_advanced(MY_CACHE_VARIABLE_G)
message(STATUS ${MY_CACHE_VARIABLE_G})

# INTERNAL can achieve the same goal but only support STRING
set(MY_CACHE_VARIABLE_I "MY_CACHE_VARIABLE_I" CACHE INTERNAL "")
message(STATUS ${MY_CACHE_VARIABLE_I})

# Set boolean variables
option(ENABLE_DBG "This is settable from the command line" OFF)
message(STATUS ${ENABLE_DBG})

# How to set and get environment variables
set(ENV{REPO_ROOT} "${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "$ENV{REPO_ROOT}")

# Set proproties
# support to set properties to multiple targets
set_property(TARGET demo PROPERTY CXX_STANDARD 11)

# support to set multiple properties to one target
set_target_properties(demo PROPERTIES CXX_STANDARD 11)

# get the properties from the target
get_property(ResultVariable TARGET demo PROPERTY CXX_STANDARD)
message(STATUS "using CXX standard = ${ResultVariable}")