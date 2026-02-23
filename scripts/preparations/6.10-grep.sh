#!/bin/bash
set -e
set -x

# The Grep package contains programs for searching through files.

echo "Step 6.10: Build Grep"
step_no=6.10
pkg_name=grep
pkg_version=3.11
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(./build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
