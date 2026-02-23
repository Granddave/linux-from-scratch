#!/bin/bash
set -e
set -x

# The Patch package contains a program for modifying or creating files by
# applying a “patch” file typically created by the diff program.

echo "Step 6.13: Build Patch"
step_no=6.13
pkg_name=patch
pkg_version=2.7.6
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
