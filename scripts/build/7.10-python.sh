#!/bin/bash
set -euo pipefail
set -x

# The Python 3 package contains the Python development environment. It is
# useful for object-oriented programming, writing scripts, prototyping large
# programs, and developing entire applications. Python is an interpreted
# computer language.

echo "Step 7.10: Build Python"

tar -xf /sources/Python-3.12.2.tar.xz -C /tmp/
mv /tmp/Python-* /tmp/python

pushd /tmp/python

./configure \
    --prefix=/usr   \
    --enable-shared \
    --without-ensurepip
make
make install

popd # /tmp/python
