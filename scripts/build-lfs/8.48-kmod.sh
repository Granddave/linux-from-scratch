#!/bin/bash

# The Kmod package contains libraries and utilities for loading kernel modules.

step_no=8.48
pkg_name=kmod
pkg_version=31
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --with-openssl \
        --with-xz \
        --with-zstd \
        --with-zlib
    make
    make install

    for target in depmod insmod modinfo modprobe rmmod; do
        ln -sfv ../bin/kmod /usr/sbin/$target
    done

    ln -sfv kmod /usr/bin/lsmod
}
