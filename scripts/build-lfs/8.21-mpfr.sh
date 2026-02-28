#!/bin/bash

# The MPFR package contains functions for multiple precision math.

step_no=8.21
pkg_name=mpfr
pkg_version=4.2.1
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --enable-thread-safe \
        --docdir=/usr/share/doc/mpfr-4.2.1

    make
    make html

    # All 198 tests should pass
    make check

    make install
    make install-html
}
