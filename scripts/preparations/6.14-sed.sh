#!/bin/bash
set -e
set -x

# The Sed package contains a stream editor.

tar -xf sed-4.9.tar.xz -C /tmp/
mv /tmp/sed-* /tmp/sed

pushd /tmp/sed

./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(./build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/sed
