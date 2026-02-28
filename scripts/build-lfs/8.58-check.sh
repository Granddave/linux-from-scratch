#!/bin/bash

# Check is a unit testing framework for C.

step_no=8.58
pkg_name=check
pkg_version=0.15.2
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr --disable-static
    make
    make check
    make docdir=/usr/share/doc/check-0.15.2 install
}
