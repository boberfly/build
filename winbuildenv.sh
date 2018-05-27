#!/bin/bash
export ROOT_DIR=C:\\$SRC_DIR_NAME
export BUILD_DIR=C:\\gafferDependenciesBuild
export ARCHIVE_DIR=C:\\$SRC_DIR_NAME\\archives
export CMAKE_GENERATOR="\"NMake Makefiles JOM\""
export BOOST_MSVC_VERSION=msvc-14.0
export BUILD_TYPE=Release
cd $SRC_DIR_NAME/winbuild
WINEDEBUG=-all wine cmd /C "C:\\msvc2017x64env.bat && $*"
