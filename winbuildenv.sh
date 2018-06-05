#!/bin/bash
export ROOT_DIR=C:\\$SRC_DIR_NAME
export BUILD_DIR=C:\\build
export ARCHIVE_DIR=C:\\$SRC_DIR_NAME\\archives
if [[ -z "${CMAKE_GENERATOR}" ]]; then
    export CMAKE_GENERATOR="\"NMake Makefiles JOM\""
fi
export BOOST_MSVC_VERSION=msvc-14.0
if [[ -z "${BUILD_TYPE}" ]]; then
    export BUILD_TYPE=Release
fi
cd winbuild
WINEDEBUG=-all wine cmd /C "C:\\msvc2017x64env.bat && $*"
