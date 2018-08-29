cmake_minimum_required (VERSION 2.8)

set (Tools_VERSION_MAJOR 1)
set (Tools_VERSION_MINOR 0)

project (tools)


configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_SOURCE_DIR}/config.h"
  )


option (USE_MYMATH "Use provided math implementation" ON)


aux_source_directory(. DIR_SRCS)


add_executable(xtools ${DIR_SRCS})

target_link_libraries(xtools ${EXTRA_LIBS})


install (TARGETS xtools DESTINATION bin)
install (FILES "${PROJECT_SOURCE_DIR}/config.h" DESTINATION include)



include (InstallRequiredSystemLibraries)
set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set (CPACK_PACKAGE_VERSION_MAJOR "${Tools_VERSION_MAJOR}")
set (CPACK_PACKAGE_VERSION_MINOR "${Tools_VERSION_MINOR}")

include (CPack)


enable_testing()
