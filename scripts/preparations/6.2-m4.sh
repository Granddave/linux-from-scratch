#!/bin/bash
set -ex

# The M4 package contains a macro processor.

echo "Step 6.2: Build M4"
step_no=6.2
pkg_name=m4
pkg_version=1.4.19
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
