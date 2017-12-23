cmake_minimum_required(VERSION 3.9)

project(cmake-with-googletest)
include(gtest.cmake)

find_package(Threads)

add_library(test_target add.cc)
add_executable(tests add_test.cc)
target_link_libraries(tests
    test_target 
    gtest
    ${CMAKE_THREAD_LIBS_INIT})
