#!/bin/bash
rm -rf build && mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER="g++" -DCMAKE_C_COMPILER="gcc"
cmake --build . --config Debug
