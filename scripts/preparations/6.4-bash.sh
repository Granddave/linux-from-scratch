#!/bin/bash
set -e
set -x

# The Bash package contains the Bourne-Again Shell.

echo "Step 6.4: Build Bash"

step_no=6.4
pkg_name=bash
pkg_version=5.2.21
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure \
        --prefix=/usr \
        --build=$(sh support/config.guess) \
        --host=$LFS_TGT \
        --without-bash-malloc
    make
    make DESTDIR=$LFS install
    ln -sv bash $LFS/bin/sh
}
