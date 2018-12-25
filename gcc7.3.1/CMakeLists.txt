cmake_minimum_required(VERSION 3.11.0 FATAL_ERROR)

################### Variables. ####################
# Change if you want modify path or other values. #
###################################################

set(PROJECT_NAME cross_compiler_project)
# Output Variables
set(OUTPUT_UNIX_DEBUG debug_bin_unix)
set(OUTPUT_UNIX_RELEASE bin_unix)
set(OUTPUT_WIN32 bin_win32)
# Folders files
set(SOURCE_DIR ./src)
set(HEADERS_DIR ./include)


############## CMake Project ################
#        The main options of project        #
#############################################

project(${PROJECT_NAME} C CXX)

# Define Release by default.
if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release")
	message(STATUS "Build type not specified: Use Release by default.")
endif(NOT CMAKE_BUILD_TYPE)

# Definition of Macros
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
	add_definitions(
	   -D_CONSOLE 
	   -DUNICODE
	   -D_UNICODE
	)
else()
	add_definitions(
	   -D_CONSOLE 
	   -DUNICODE
	   -D_UNICODE
	)
endif()

############## Artefacts Output #################
# Defines outputs , depending Debug or Release. #
#################################################

# on UNIX there is no Debug nor Release subfolder so I specify a different for each configuration
if (UNIX)
	if(CMAKE_BUILD_TYPE STREQUAL "Debug")
	  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_UNIX_DEBUG})
	  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_UNIX_DEBUG})
	  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_UNIX_DEBUG})
	else()
	  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_UNIX_RELEASE})
	  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_UNIX_RELEASE})
	  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_UNIX_RELEASE})
	endif()
endif (UNIX)
# on WIN32 Debug and Release folders are created automatically
if (WIN32)
	  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_WIN32})
	  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_WIN32})
	  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${OUTPUT_WIN32})
endif (WIN32)

################# Flags ################
# Defines Flags for Windows and Linux. #

if(MSVC)
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /W3 /MD /Od /Zi /EHsc")
	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /W3 /GL /Od /Oi /Gy /Zi /EHsc")
endif(MSVC)
if(NOT MSVC)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -D_GLIBCXX_USE_CXX11_ABI=0")
endif(NOT MSVC)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	set(BINARY_NAME ${PROJECT_NAME}d)
	set(DEPENDENCY_LIBS libcored.so)
else()
	set(BINARY_NAME ${PROJECT_NAME})
	set(DEPENDENCY_LIBS libcore.so)
endif()

################ Files ################
#   --   Add files to project.   --   #
#

# include files
include_directories(${HEADERS_DIR})

# source files
set(SOURCE_FILES ${SOURCE_DIR}/main.cpp)

set(GCC34_LIB_DIR ../gcc3.4.6)
# lib headers
include_directories(${GCC34_LIB_DIR}/include)
# libs directory to link
link_directories(/usr/local/lib)

# Add binaries to build.
add_executable(${BINARY_NAME} ${SOURCE_FILES})
target_link_libraries(${BINARY_NAME} ${DEPENDENCY_LIBS})

# generate debug files
ADD_CUSTOM_COMMAND(TARGET ${BINARY_NAME} POST_BUILD
	COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${BINARY_NAME}>
				${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${BINARY_NAME}.debug
	COMMAND ${CMAKE_STRIP} -g $<TARGET_FILE:${BINARY_NAME}>)