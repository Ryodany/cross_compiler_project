#!/bin/bash
rm -rf build && mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER="g++34" -DCMAKE_C_COMPILER="gcc34"
cmake --build . --config Debug

