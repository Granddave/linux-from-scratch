#!/bin/bash
set -e
set -x

#

echo "Step "

tar -xf  -C /tmp/
mv /tmp/diffutils-* /tmp/diffutils

pushd /tmp/diffutils

make
make DESTDIR=$LFS install

popd # /tmp/diffutils
