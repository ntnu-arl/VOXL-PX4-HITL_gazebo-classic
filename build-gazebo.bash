#!/bin/bash
#
# Build the gazebo plugins
#

rm -fR build
mkdir build
cd build
cmake ..
make
cd ..