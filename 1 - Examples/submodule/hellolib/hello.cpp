#include "hello.hpp"
#include <iostream>

/**
 * Prints the given name in uppercase
 */
static void hello(const char* nameUpperCase) {
    std::cout << "Hello, " << nameUpperCase << '\n';
}

void PrintHello(const char* argv) {
    HelloFun_S helloFun = {hello};
    helloFun.func(argv);
}