#!/bin/bash
set -e
set -x

# The Gzip package contains programs for compressing and decompressing files.

echo "Step 6.11: Build Gzip"
step_no=6.11
pkg_name=gzip
pkg_version=1.13
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr --host=$LFS_TGT
    make
    make DESTDIR=$LFS install
}
