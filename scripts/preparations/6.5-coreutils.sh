#!/bin/bash
set -e
set -x

# The Coreutils package contains the basic utility programs needed by every
# operating system.

tar -xf coreutils-9.4.tar.xz -C /tmp/
mv /tmp/coreutils-* /tmp/coreutils

pushd /tmp/coreutils

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

popd # /tmp/coreutils
