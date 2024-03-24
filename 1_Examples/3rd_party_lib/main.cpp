/* ************************************************************************
> File Name:     main.cpp
> Author:        Maxin
> mail:          lyingflatlearner@gmail.com
> Created Time:  Sun Mar 24 08:25:20 2024
> Description:   
 ************************************************************************/

#include <vec3.hpp>
#include <iostream>

inline std::ostream &operator<<(std::ostream &os, glm::vec3 const &v) {
    return os << v.x << ' ' << v.y << ' ' << v.z;
}

int main() {
    glm::vec3 v(1, 2, 3);
    v += 1;
    std::cout << v << std::endl;
    return 0;
}
