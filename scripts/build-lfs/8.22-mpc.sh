#!/bin/bash

# The MPC package contains a library for the arithmetic of complex numbers with
# arbitrarily high precision and correct rounding of the result.

step_no=8.22
pkg_name=mpc
pkg_version=1.3.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/mpc-1.3.1

    make
    make html

    make check

    make install
    make install-html
}
