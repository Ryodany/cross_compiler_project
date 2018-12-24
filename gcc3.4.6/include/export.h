#pragma once

#if defined(_MSC_VER)
    //  Microsoft 
    #define LIB_EXPORT __declspec(dllexport)
    #define LIB_IMPORT __declspec(dllimport)
#elif defined(__GNUC__)
    //  GCC
    #define LIB_EXPORT __attribute__((visibility("default")))
    #define LIB_IMPORT
#else
    #define LIB_EXPORT
    #define LIB_IMPORT
    #pragma warning Unknown dynamic link import/export semantics.
#endif
