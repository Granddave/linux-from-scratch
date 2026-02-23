#!/bin/bash
# The Binutils package contains a linker, an assembler, and other tools for handling object files.

echo "Step 5.2: Build Binutils"
step_no=5.2
pkg_name="binutils"
pkg_version="2.42"
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    mkdir -v build
    pushd build
    ../configure \
        --prefix=$LFS/tools \
        --with-sysroot=$LFS \
        --target=$LFS_TGT \
        --disable-nls \
        --enable-gprofng=no \
        --disable-werror \
        --enable-default-hash-style=gnu
    make
    make install
    popd # build
}

