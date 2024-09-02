#!/bin/bash
set -e
set -x

# The Patch package contains a program for modifying or creating files by
# applying a “patch” file typically created by the diff program.

tar -xf patch-2.7.6.tar.xz -C /tmp/
mv /tmp/patch-* /tmp/patch

pushd /tmp/patch

./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/patch
