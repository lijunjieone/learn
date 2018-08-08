cmake_minimum_required (VERSION 2.8)

set (Demo_VERSION_MAJOR 1)
set (Demo_VERSION_MINOR 0)

set(CMAKE_BUILD_TYPE "Debug")
set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

project (demo4)


include (${CMAKE_ROOT}/Modules/CheckFunctionExists.cmake)
check_function_exists (pow HAVE_POW)

configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_SOURCE_DIR}/config.h"
  )


option (USE_MYMATH "Use provided math implementation" ON)

if (NOT HAVE_POW)
   include_directories("${PROJECT_SOURCE_DIR}/math")
   add_subdirectory(math)
   set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (NOT HAVE_POW)

aux_source_directory(. DIR_SRCS)


add_executable(demo ${DIR_SRCS})

target_link_libraries(demo ${EXTRA_LIBS})


install (TARGETS demo DESTINATION bin)
install (FILES "${PROJECT_SOURCE_DIR}/config.h" DESTINATION include)



include (InstallRequiredSystemLibraries)
set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set (CPACK_PACKAGE_VERSION_MAJOR "${Demo_VERSION_MAJOR}")
set (CPACK_PACKAGE_VERSION_MINOR "${Demo_VERSION_MINOR}")

include (CPack)


enable_testing()

add_test (test_run demo 5 2)

add_test (test_usage demo)
set_tests_properties (test_usage PROPERTIES PASS_REGULAR_EXPRESSION "Usage: .* base exponent")

add_test (test_2_4 demo 2 4)
set_tests_properties (test_2_4 PROPERTIES PASS_REGULAR_EXPRESSION "is 16")

macro (do_test arg1 arg2 result)
  add_test (test_${arg1}_${arg2} demo ${arg1} ${arg2})
  set_tests_properties (test_${arg1}_${arg2} PROPERTIES PASS_REGULAR_EXPRESSION ${result})

endmacro (do_test)

do_test (5 2 "is 25")
do_test (2 4 "is 16")

