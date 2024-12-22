#!/bin/bash
set -euo pipefail
set -x

# The Util-linux package contains miscellaneous utility programs

echo "Step 7.12: Build Util-linux"

tar -xf /sources/util-linux-2.39.3.tar.xz -C /tmp/
mv /tmp/util-linux-* /tmp/util-linux

pushd /tmp/util-linux

mkdir -pv /var/lib/hwclock

./configure \
    --libdir=/usr/lib    \
    --runstatedir=/run   \
    --disable-chfn-chsh  \
    --disable-login      \
    --disable-nologin    \
    --disable-su         \
    --disable-setpriv    \
    --disable-runuser    \
    --disable-pylibmount \
    --disable-static     \
    --without-python     \
    ADJTIME_PATH=/var/lib/hwclock/adjtime \
    --docdir=/usr/share/doc/util-linux-2.39.3
make
make install

popd # /tmp/util-linux
