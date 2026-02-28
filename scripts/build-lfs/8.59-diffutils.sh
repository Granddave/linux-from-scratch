#!/bin/bash

# The Diffutils package contains programs that show the differences between
# files or directories.

step_no=8.59
pkg_name=diffutils
pkg_version=3.10
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
