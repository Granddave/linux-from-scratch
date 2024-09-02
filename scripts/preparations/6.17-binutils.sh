#!/bin/bash
set -e
set -x

# The Binutils package contains a linker, an assembler, and other tools for
# handling object files.

tar -xf binutils-2.42.tar.xz -C /tmp/
mv /tmp/binutils-* /tmp/binutils-pass2

pushd /tmp/binutils-pass2

sed '6009s/$add_dir//' -i ltmain.sh

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

popd # /tmp/binutils-pass2
