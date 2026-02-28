#!/bin/bash

# The Expat package contains a stream oriented C library for parsing XML.

step_no=8.39
pkg_name=expat
pkg_version=2.6.2
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/expat-$pkg_version
    make
    make check
    make install
    install -v -m644 doc/*.{html,css} /usr/share/doc/expat-$pkg_version
}
