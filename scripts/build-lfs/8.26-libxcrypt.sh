#!/bin/bash

# The Libxcrypt package contains a modern library for one-way hashing of
# passwords.

step_no=8.26
pkg_name=libxcrypt
pkg_version=4.4.36
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --enable-hashes=strong,glibc \
        --enable-obsolete-api=no \
        --disable-static \
        --disable-failure-tokens

    make
    make check
    make install
}
