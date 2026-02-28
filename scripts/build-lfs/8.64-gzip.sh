#!/bin/bash

# The Gzip package contains programs for compressing and decompressing files.

step_no=8.64
pkg_name=gzip
pkg_version=1.13
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
