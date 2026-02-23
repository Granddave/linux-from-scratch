#!/bin/bash
set -e
set -x

# The Tar package provides the ability to create tar archives as well as
# perform various other kinds of archive manipulation. Tar can be used on
# previously created archives to extract files, to store additional files, or
# to update or list files which were already stored.

echo "Step 6.15: Build Tar"
step_no=6.15
pkg_name=tar
pkg_version=1.35
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
