cmake_minimum_required(VERSION 3.10)
project(gin-like-cpp-web-framework)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include_directories(libs/asio/include)

add_executable(main src/main.cpp src/server.cpp src/request_parser.cpp src/http_response.cpp)
