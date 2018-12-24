
# cross_compiler_project

C++ Project to test linkage with GCC 7.3.1 binaries against pre C++11 GCC 3.4.6 binaries.

## Disclaimer

Only tested under Fedora 27.

#### Requirements
 - <pre>compat-gcc-34-3.4.6-46.fc27.x86_64</pre>
 - <pre>compat-gcc-34-c++-3.4.6-46.fc27.x86_64</pre>
 - <pre>gcc-c++</pre>

## Build library with gcc 3.4.6

 - cd gcc3.4.6
 - bash build.sh
 - bash install.sh 
 
## Build executable under gcc 7.3.1

 - cd gcc7.3.1
 - bash build.sh
 
## Run

 - ./gcc7.3.1/bin_unix/cross_compiler_project
 