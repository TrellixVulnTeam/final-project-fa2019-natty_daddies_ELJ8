#-----------------------------------------------------------------------------
#
# OPENJPEGConfig.cmake - CMake configuration file for external projects.
#
# This file is configured by OPENJPEG and used by the UseOPENJPEG.cmake
# module to load OPENJPEG's settings for an external project.

# The OPENJPEG version number.
set(OPENJPEG_MAJOR_VERSION "2")
set(OPENJPEG_MINOR_VERSION "3")
set(OPENJPEG_BUILD_VERSION "1")

# The libraries.
set(OPENJPEG_LIBRARIES "openjp2")

# The CMake macros dir.
set(OPENJPEG_CMAKE_DIR "lib/openjpeg-2.3")

# The configuration options.
set(OPENJPEG_BUILD_SHARED_LIBS "ON")

# The "use" file.
set(OPENJPEG_USE_FILE "")

get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
  # This is an install tree
  include(${SELF_DIR}/OpenJPEGTargets.cmake)

  # We find a relative path from the PKG directory to header files.
  set(PKG_DIR "/home/jupyter-bweill/final-project-fa2019-natty_daddies/geoplot/lib/openjpeg-2.3")
  set(INC_DIR "/home/jupyter-bweill/final-project-fa2019-natty_daddies/geoplot/include/openjpeg-2.3")
  file(RELATIVE_PATH PKG_TO_INC_RPATH "${PKG_DIR}" "${INC_DIR}")

  get_filename_component(OPENJPEG_INCLUDE_DIRS "${SELF_DIR}/${PKG_TO_INC_RPATH}" ABSOLUTE)

else()
  if(EXISTS ${SELF_DIR}/OpenJPEGExports.cmake)
    # This is a build tree
    set( OPENJPEG_INCLUDE_DIRS )

    include(${SELF_DIR}/OpenJPEGExports.cmake)

  else()
    message(FATAL_ERROR "ooops")
  endif()
endif()

set(OPENJPEG_USE_FILE ${SELF_DIR}/UseOPENJPEG.cmake)

# Backward compatible part:
set(OPENJPEG_FOUND       TRUE)

