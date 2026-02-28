#!/bin/bash

# The Bc package contains an arbitrary precision numeric processing language.

step_no=8.13
pkg_name=bc
pkg_version=6.7.5
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    CC=gcc ./configure \
        --prefix=/usr \
        -G \
        -O3 \
        -r
    make
    make test
    make install
}
