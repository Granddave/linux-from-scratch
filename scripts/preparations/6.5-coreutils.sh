#!/bin/bash
set -e
set -x

# The Coreutils package contains the basic utility programs needed by every
# operating system.

echo "Step 6.5: Build Coreutils"

step_no=6.5
pkg_name=coreutils
pkg_version=9.4
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess) \
        --enable-install-program=hostname \
        --enable-no-install-program=kill,uptime
    make
    make DESTDIR=$LFS install

    mv -v $LFS/usr/bin/chroot $LFS/usr/sbin
    mkdir -pv $LFS/usr/share/man/man8
    mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
    sed -i 's/"1"/"8"/' $LFS/usr/share/man/man8/chroot.8
}
