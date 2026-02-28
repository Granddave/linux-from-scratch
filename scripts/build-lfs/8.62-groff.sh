#!/bin/bash

# The Groff package contains programs for processing and formatting text and
# images.

step_no=8.62
pkg_name=groff
pkg_version=1.23.0
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    PAGE=A4 ./configure --prefix=/usr
    make
    make check
    make install
}
