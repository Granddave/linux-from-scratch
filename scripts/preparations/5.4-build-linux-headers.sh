#!/bin/bash
set -e
set -x

# The Linux API Headers (in linux-6.7.4.tar.xz) expose the kernel's API for use by Glibc.

echo "Step 5.4: Build Linux Headers"
step_no=5.4
pkg_name=linux
pkg_version=6.7.4
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    make mrproper
    make headers
    find usr/include -type f ! -name '*.h' -delete
    cp -rv usr/include $LFS/usr
}
