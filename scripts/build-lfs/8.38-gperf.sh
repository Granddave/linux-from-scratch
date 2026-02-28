#!/bin/bash

# Gperf generates a perfect hash function from a key set.

step_no=8.38
pkg_name=gperf
pkg_version=3.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
    make
    make -j1 check
    make install
}
