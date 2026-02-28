#!/bin/bash

# The Patch package contains a program for modifying or creating files by
# applying a “patch” file typically created by the diff program.

step_no=8.69
pkg_name=patch
pkg_version=2.7.6
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
}
