#!/bin/bash
set -e
set -x

# The Diffutils package contains programs that show the differences between
# files or directories.

tar -xf diffutils-3.10.tar.xz -C /tmp/
mv /tmp/diffutils-* /tmp/diffutils

pushd /tmp/diffutils

./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(./build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/diffutils
