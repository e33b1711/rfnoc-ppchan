# Copyright 2011,2012 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIRS})
list(APPEND ppchan_sources
    chan128_impl.cc
    chan128_block_ctrl_impl.cpp
    chan256_impl.cc
    chan256_block_ctrl_impl.cpp
    )


set(ppchan_sources "${ppchan_sources}" PARENT_SCOPE)
if(NOT ppchan_sources)
	MESSAGE(STATUS "No C++ sources... skipping lib/")
	return()
endif(NOT ppchan_sources)

add_library(gnuradio-ppchan SHARED ${ppchan_sources})
target_link_libraries(gnuradio-ppchan ${Boost_LIBRARIES} ${GNURADIO_ALL_LIBRARIES} ${ETTUS_LIBRARIES})
set_target_properties(gnuradio-ppchan PROPERTIES DEFINE_SYMBOL "gnuradio_ppchan_EXPORTS")

if(APPLE)
    set_target_properties(gnuradio-ppchan PROPERTIES
        INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib"
    )
endif(APPLE)

########################################################################
# Install built library files
########################################################################
install(TARGETS gnuradio-ppchan
    LIBRARY DESTINATION lib${LIB_SUFFIX} # .so/.dylib file
    ARCHIVE DESTINATION lib${LIB_SUFFIX} # .lib file
    RUNTIME DESTINATION bin              # .dll file
)

########################################################################
# Build and register unit test
########################################################################
include(GrTest)

include_directories(${CPPUNIT_INCLUDE_DIRS})

list(APPEND test_ppchan_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/test_ppchan.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/qa_ppchan.cc
)

add_executable(test-ppchan ${test_ppchan_sources})

target_link_libraries(
  test-ppchan
  ${GNURADIO_RUNTIME_LIBRARIES}
  ${Boost_LIBRARIES}
  ${CPPUNIT_LIBRARIES}
  ${ETTUS_LIBRARIES}
  ${PC_ETTUS_LIBDIR}
  gnuradio-ppchan
)



GR_ADD_TEST(test_ppchan test-ppchan)
