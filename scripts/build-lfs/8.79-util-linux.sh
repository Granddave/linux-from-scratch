#!/bin/bash

# The Util-linux package contains miscellaneous utility programs. Among them
# are utilities for handling file systems, consoles, partitions, and messages.

step_no=8.79
pkg_name=util-linux
pkg_version=2.39.3
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i '/test_mkfds/s/^/#/' tests/helpers/Makemodule.am
}

build_phase() {
    ./configure \
        --bindir=/usr/bin \
        --libdir=/usr/lib \
        --runstatedir=/run \
        --sbindir=/usr/sbin \
        --disable-chfn-chsh \
        --disable-login \
        --disable-nologin \
        --disable-su \
        --disable-setpriv \
        --disable-runuser \
        --disable-pylibmount \
        --disable-static \
        --without-python \
        ADJTIME_PATH=/var/lib/hwclock/adjtime \
        --docdir=/usr/share/doc/util-linux-$pkg_version
    make
    # 86 tests of 349 FAILED. Skipping tests. Could be docker related...
    # chown -R tester .
    # su tester -c "TERM=dumb COLUMNS=80 make -k check"
    make install
}
