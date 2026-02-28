#!/bin/bash

# The Grep package contains programs for searching through the contents of
# files.

step_no=8.34
pkg_name=grep
pkg_version=3.11
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i "s/echo/#echo/" src/egrep.sh
}

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
