cmake_minimum_required (VERSION 2.8)

project (demo1)

aux_source_directory(. DIR_SRCS)


add_executable(demo ${DIR_SRCS} )