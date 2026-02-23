#!/bin/bash
# The Xz package contains programs for compressing and decompressing files. It
# provides capabilities for the lzma and the newer xz compression formats.
# Compressing text files with xz yields a better compression percentage than
# with the traditional gzip or bzip2 commands.

step_no=8.8
pkg_name=xz
pkg_version=5.4.6
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/xz-5.4.6

    make
    make check
    make install
}
