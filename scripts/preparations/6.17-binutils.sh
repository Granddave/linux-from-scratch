#!/bin/bash
set -e
set -x

# The Binutils package contains a linker, an assembler, and other tools for
# handling object files.

echo "Step 6.17: Build Binutils (pass 2)"
step_no=6.17
pkg_name="binutils"
pkg_version="2.42"
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed '6009s/$add_dir//' -i ltmain.sh
}

build_phase() {
    mkdir -v build
    pushd build
    ../configure \
        --prefix=/usr \
        --build=$(../config.guess) \
        --host=$LFS_TGT \
        --disable-nls \
        --enable-shared \
        --enable-gprofng=no \
        --disable-werror \
        --enable-64-bit-bfd \
        --enable-default-hash-style=gnu
    make
    make DESTDIR=$LFS install
    popd # build

    rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}
}
