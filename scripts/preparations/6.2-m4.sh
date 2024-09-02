#!/bin/bash
set -e
set -x

# The M4 package contains a macro processor.

tar -xf m4-1.4.19.tar.xz -C /tmp/
mv /tmp/m4-* /tmp/m4

pushd /tmp/m4


./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/m4
