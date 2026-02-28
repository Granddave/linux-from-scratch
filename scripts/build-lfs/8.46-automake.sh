#!/bin/bash

# The Automake package contains programs for generating Makefiles for use with
# Autoconf.

step_no=8.46
pkg_name=automake
pkg_version=1.16.5
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr --docdir=/usr/share/doc/automake-$pkg_version
    make
    make -j$(($(nproc) > 4 ? $(nproc) : 4)) check
    make install
}
