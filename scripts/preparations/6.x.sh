#!/bin/bash
set -e
set -x

#

tar -xf  -C /tmp/
mv /tmp/diffutils-* /tmp/diffutils

pushd /tmp/diffutils

make
make DESTDIR=$LFS install

popd # /tmp/diffutils
