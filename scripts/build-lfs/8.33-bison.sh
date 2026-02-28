#!/bin/bash

# The Bison package contains a parser generator.

step_no=8.33
pkg_name=bison
pkg_version=3.8.2
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
    make
    make check
    make install
}
