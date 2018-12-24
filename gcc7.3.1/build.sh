#!/bin/bash
rm -rf build && mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_COMPILER="g++" -DCMAKE_C_COMPILER="gcc"
cmake --build . --config RelWithDebInfo
