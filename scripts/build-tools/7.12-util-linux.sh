#!/bin/bash
# The Util-linux package contains miscellaneous utility programs

step_no=7.12
pkg_name=util-linux
src_tar=util-linux-2.39.3.tar.xz

build() {
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
}
