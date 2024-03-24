add_library(hellolib STATIC hello.cpp)
target_include_directories(hellolib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}) 