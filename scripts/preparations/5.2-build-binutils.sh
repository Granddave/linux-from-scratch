#!/bin/bash
set -e
set -x

# The Binutils package contains a linker, an assembler, and other tools for handling object files.

tar -xf binutils-2.42.tar.xz -C /tmp/
mv /tmp/binutils-* /tmp/binutils
pushd /tmp/binutils
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
popd # /tmp/binutils
