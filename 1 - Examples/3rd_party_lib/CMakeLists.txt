cmake_minimum_required(VERSION 3.12)
project(hellocmake LANGUAGES CXX)

add_executable(hellocmake main.cpp)
target_include_directories(hellocmake PUBLIC glm/glm/)
