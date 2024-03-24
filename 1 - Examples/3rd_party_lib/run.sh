#########################################################################
# File Name:    run.sh
# Author:       Maxin
# mail:         lyingflatlearner@gmail.com
# Created Time: Sun Mar 24 08:38:15 2024
#########################################################################
#!/bin/bash

if [ ! -d ./build ]; then
   mkdir build
fi

cmake -S . -B ./build
cmake --build build --clean-first
