#!/bin/bash

# The File package contains a utility for determining the type of a given file
# or files.

step_no=8.10
pkg_name=file
pkg_version=5.45
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
