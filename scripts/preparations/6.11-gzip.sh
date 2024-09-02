#!/bin/bash
set -e
set -x

# The Gzip package contains programs for compressing and decompressing files.

tar -xf gzip-1.13.tar.xz -C /tmp/
mv /tmp/gzip-* /tmp/gzip

pushd /tmp/gzip

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install

popd # /tmp/gzip
