#!/bin/bash
set -e
set -x

# The File package contains a utility for determining the type of a given file
# or files.

tar -xf file-5.45.tar.gz -C /tmp/
mv /tmp/file-* /tmp/file

pushd /tmp/file

mkdir build
pushd build
../configure \
    --disable-bzlib \
    --disable-libseccomp \
    --disable-xzlib \
    --disable-zlib
make
popd # build

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/libmagic.la

popd # /tmp/file
