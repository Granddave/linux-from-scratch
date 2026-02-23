#!/bin/bash
set -e
set -x

# The Gawk package contains programs for manipulating text files.

echo "Step 6.9: Build Gawk"
step_no=6.9
pkg_name=gawk
pkg_version=5.3.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i 's/extras//' Makefile.in
}

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
