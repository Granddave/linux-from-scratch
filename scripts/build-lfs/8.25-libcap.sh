#!/bin/bash

# The Libcap package implements the userspace interface to the POSIX 1003.1e
# capabilities available in Linux kernels. These capabilities partition the
# all-powerful root privilege into a set of distinct privileges.

step_no=8.25
pkg_name=libcap
pkg_version=2.69
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i '/install -m.*STA/d' libcap/Makefile
}

build_phase() {
    make prefix=/usr lib=lib
    make test
    make prefix=/usr lib=lib install
}
