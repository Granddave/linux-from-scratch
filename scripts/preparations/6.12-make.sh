#!/bin/bash
set -e
set -x

# The Make package contains a program for controlling the generation of
# executables and other non-source files of a package from source files.

tar -xf make-4.4.1.tar.gz -C /tmp/
mv /tmp/make-* /tmp/make

pushd /tmp/make

./configure \
    --prefix=/usr \
    --without-guile \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/make
