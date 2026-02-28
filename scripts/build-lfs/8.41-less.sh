#!/bin/bash

# The Less package contains a text file viewer.

step_no=8.41
pkg_name=less
pkg_version=643
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr --sysconfdir=/etc
    make
    make check
    make install
}
