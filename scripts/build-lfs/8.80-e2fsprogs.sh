#!/bin/bash

# The E2fsprogs package contains the utilities for handling the ext2 file
# system. It also supports the ext3 and ext4 journaling file systems.

step_no=8.80
pkg_name=e2fsprogs
pkg_version=1.47.0
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    mkdir -v build
    cd build
    ../configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-elf-shlibs \
        --disable-libblkid \
        --disable-libuuid \
        --disable-uuidd \
        --disable-fsck

    make
    # One test is known to fail
    make check
    make install
    rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

    gunzip -v /usr/share/info/libext2fs.info.gz
    install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

    sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf
}
