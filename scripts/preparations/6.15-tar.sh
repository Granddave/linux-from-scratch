#!/bin/bash
set -e
set -x

# The Tar package provides the ability to create tar archives as well as
# perform various other kinds of archive manipulation. Tar can be used on
# previously created archives to extract files, to store additional files, or
# to update or list files which were already stored.

tar -xf tar-1.35.tar.xz -C /tmp/
mv /tmp/tar-* /tmp/tar

pushd /tmp/tar

./configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

popd # /tmp/tar
