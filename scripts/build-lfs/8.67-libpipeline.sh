#!/bin/bash

# The Libpipeline package contains a library for manipulating pipelines of
# subprocesses in a flexible and convenient way.

step_no=8.67
pkg_name=libpipeline
pkg_version=1.5.7
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
