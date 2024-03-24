#include <iostream>
#include <string>
#include <fmt/core.h>

int main() {
    std::string msg = fmt::format("The answer is {}.\n", 42);
    std::cout << msg << std::endl;
    return 0;
}
