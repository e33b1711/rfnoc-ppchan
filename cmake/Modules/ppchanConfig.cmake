INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_PPCHAN ppchan)

FIND_PATH(
    PPCHAN_INCLUDE_DIRS
    NAMES ppchan/api.h
    HINTS $ENV{PPCHAN_DIR}/include
        ${PC_PPCHAN_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    PPCHAN_LIBRARIES
    NAMES gnuradio-ppchan
    HINTS $ENV{PPCHAN_DIR}/lib
        ${PC_PPCHAN_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PPCHAN DEFAULT_MSG PPCHAN_LIBRARIES PPCHAN_INCLUDE_DIRS)
MARK_AS_ADVANCED(PPCHAN_LIBRARIES PPCHAN_INCLUDE_DIRS)

