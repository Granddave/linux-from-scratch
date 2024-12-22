#!/bin/bash
set -euo pipefail
set -x

# The Bison package contains a parser generator.

echo "Step 7.8: Build Bison"

tar -xf /sources/bison-3.8.2.tar.xz -C /tmp/
mv /tmp/bison-* /tmp/bison

pushd /tmp/bison

./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/bison-3.8.2
make
make install

popd # /tmp/bison
