cmake_minimum_required (VERSION 2.8)

project (demo4)
include_directories("/usr/local/Cellar/openssl/1.0.2d_1/include/")
#LINK_DIRECTORIES("/usr/local/Cellar/openssl/1.0.2d_1/lib/")
link_libraries(“/usr/local/Cellar/openssl/1.0.2d_1/lib/libssl.a”)

aux_source_directory(. DIR_SRCS)
add_executable(demo ${DIR_SRCS})
#target_link_libraries(crypto ssl)

