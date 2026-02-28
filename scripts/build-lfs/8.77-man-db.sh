#!/bin/bash

# The Man-DB package contains programs for finding and viewing man pages.

step_no=8.77
pkg_name=man-db
pkg_version=2.12.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --docdir=/usr/share/doc/man-db-$pkg_version \
        --sysconfdir=/etc \
        --disable-setuid \
        --enable-cache-owner=bin \
        --with-browser=/usr/bin/lynx \
        --with-vgrind=/usr/bin/vgrind \
        --with-grap=/usr/bin/grap
    make
    make check
    make install
}
