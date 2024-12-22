#!/bin/bash
set -euo pipefail
set -x

# The Texinfo package contains programs for reading, writing, and converting
# info pages.

echo "Step 7.11: Build texinfo"

tar -xf /sources/texinfo-7.1.tar.xz -C /tmp/
mv /tmp/texinfo-* /tmp/texinfo

pushd /tmp/texinfo

./configure \
    --prefix=/usr
make
make install

popd # /tmp/texinfo
