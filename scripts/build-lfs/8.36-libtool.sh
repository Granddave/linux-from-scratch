#!/bin/bash

# The Libtool package contains the GNU generic library support script. It makes
# the use of shared libraries simpler with a consistent, portable interface.

step_no=8.36
pkg_name=libtool
pkg_version=2.4.7
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr
    make
    # > Five tests are known to fail in the LFS build environment due to a
    # > circular dependency
    #make -k check
    make install
    rm -fv /usr/lib/libltdl.a
}
