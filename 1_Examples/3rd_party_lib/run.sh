#########################################################################
# File Name:    run.sh
# Author:       Maxin
# mail:         lyingflatlearner@gmail.com
# Created Time: Sun Mar 24 08:38:15 2024
#########################################################################
#!/bin/bash

# Init the submodule if haven't done yet
if git submodule status | grep --quiet "^-"; then
    git submodule init && git submodule update
fi

# Create build folder
if [ ! -d ./build ]; then
   mkdir build
fi

cmake -S . -B ./build
cmake --build build --clean-first
