#!/bin/bash

# The Autoconf package contains programs for producing shell scripts that can
# automatically configure source code.

step_no=8.45
pkg_name=autoconf
pkg_version=2.72
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
