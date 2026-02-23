#!/bin/bash
set -e
set -x

# The Sed package contains a stream editor.

echo "Step 6.14: Build Sed"
step_no=6.14
pkg_name=sed
pkg_version=4.9
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(./build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
