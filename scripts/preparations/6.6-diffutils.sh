#!/bin/bash
set -e
set -x

# The Diffutils package contains programs that show the differences between
# files or directories.

echo "Step 6.6: Build Diffutils"
step_no=6.6
pkg_name=diffutils
pkg_version=3.10
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(./build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
