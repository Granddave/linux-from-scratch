#!/bin/bash
set -e
set -x

# The Grep package contains programs for searching through files.

tar -xf grep-3.11.tar.xz -C /tmp/
mv /tmp/grep-* /tmp/grep

pushd /tmp/grep

./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(./build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/grep
