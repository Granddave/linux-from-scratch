#!/bin/bash

# The M4 package contains a macro processor.

step_no=8.12
pkg_name=m4
pkg_version=1.4.19
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr
    make
    make check
    make install
}
