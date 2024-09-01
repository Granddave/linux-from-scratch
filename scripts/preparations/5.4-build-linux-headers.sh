#!/bin/bash
set -e
set -x

# The Linux API Headers (in linux-6.7.4.tar.xz) expose the kernel's API for use by Glibc.

tar -xf linux-6.7.4.tar.xz -C /tmp/
mv /tmp/linux-* /tmp/linux

pushd /tmp/linux
make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr
popd
