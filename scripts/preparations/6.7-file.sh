#!/bin/bash
set -e
set -x

# The File package contains a utility for determining the type of a given file
# or files.

echo "Step 6.7: Build File"
step_no=6.7
pkg_name=file
pkg_version=5.45
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    mkdir build
    pushd build
    ../configure \
        --disable-bzlib \
        --disable-libseccomp \
        --disable-xzlib \
        --disable-zlib
    make
    popd # build

    ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
    make FILE_COMPILE=$(pwd)/build/src/file
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/libmagic.la
}
