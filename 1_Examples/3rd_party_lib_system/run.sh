#########################################################################
# File Name:    run.sh
# Author:       Maxin
# mail:         lyingflatlearner@gmail.com
# Created Time: Sun Mar 24 08:38:15 2024
#########################################################################
#!/bin/bash

# Install the lib if not done yet
git clone https://github.com/microsoft/vcpkg.git --depth=1
cd vcpkg
sh bootstrap-vcpkg.sh
./vcpkg install fmt:x64-linux
cd ..

# Create build folder
if [ ! -d ./build ]; then
   mkdir build
fi

cmake -S . -B ./build -DCMAKE_TOOLCHAIN_FILE="$PWD/vcpkg/scripts/buildsystems/vcpkg.cmake"
cmake --build build --clean-first
