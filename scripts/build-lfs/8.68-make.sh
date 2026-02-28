#!/bin/bash

# The Make package contains a program for controlling the generation of
# executables and other non-source files of a package from source files.

step_no=8.68
pkg_name=make
pkg_version=4.4.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr
    make
    chown -R tester .
    su tester -c "PATH=$PATH make check"
    make install
}
