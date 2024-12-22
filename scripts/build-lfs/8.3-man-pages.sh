#!/bin/bash
set -euo pipefail
set -x

# The Man-pages package contains over 2,400 man pages.

echo "Step 8.3: Build man-pages"

tar -xf /sources/man-pages-6.06.tar.xz -C /tmp/
mv /tmp/man-pages-* /tmp/man-pages

pushd /tmp/man-pages

rm -v man3/crypt*
make prefix=/usr install

popd # /tmp/man-pages
