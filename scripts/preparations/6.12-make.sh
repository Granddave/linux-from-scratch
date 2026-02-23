#!/bin/bash
set -e
set -x

# The Make package contains a program for controlling the generation of
# executables and other non-source files of a package from source files.

echo "Step 6.12: Build Make"
step_no=6.12
pkg_name=make
pkg_version=4.4.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure \
        --prefix=/usr \
        --without-guile \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
