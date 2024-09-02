#!/bin/bash
set -e
set -x

# The Gawk package contains programs for manipulating text files.

tar -xf gawk-5.3.0.tar.xz -C /tmp/
mv /tmp/gawk-* /tmp/gawk

pushd /tmp/gawk

sed -i 's/extras//' Makefile.in
./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/gawk
