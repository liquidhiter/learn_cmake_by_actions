#########################################################################
# File Name:    run.sh
# Author:       Maxin
# mail:         lyingflatlearner@gmail.com
# Created Time: Sun Mar 24 08:38:15 2024
#########################################################################
#!/bin/bash

# # Init the submodule
# if [ ! -d ./glm ]; then
#    git 

# Create build folder
if [ ! -d ./build ]; then
   mkdir build
fi

cmake -S . -B ./build
cmake --build build --clean-first
