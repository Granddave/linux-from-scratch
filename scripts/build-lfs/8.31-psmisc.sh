#!/bin/bash

# The Psmisc package contains programs for displaying information about running
# processes.

step_no=8.31
pkg_name=psmisc
pkg_version=23.6
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
