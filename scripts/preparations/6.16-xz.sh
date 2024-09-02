#!/bin/bash
set -e
set -x

# The Xz package contains programs for compressing and decompressing files. It
# provides capabilities for the lzma and the newer xz compression formats.
# Compressing text files with xz yields a better compression percentage than
# with the traditional gzip or bzip2 commands.

tar -xf xz-5.4.6.tar.xz -C /tmp/
mv /tmp/xz-* /tmp/xz

pushd /tmp/xz

./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess) \
    --disable-static \
    --docdir=/usr/share/doc/xz-5.4.6
make
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la

popd # /tmp/xz
