#!/bin/bash
# The Zlib package contains compression and decompression routines used by some
# programs.

step_no=8.6
pkg_name=zlib
pkg_version=1.3.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
    rm -fv /usr/lib/libz.a
}
