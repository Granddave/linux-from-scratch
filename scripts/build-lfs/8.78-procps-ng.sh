#!/bin/bash

# The Procps-ng package contains programs for monitoring processes.

step_no=8.78
pkg_name=procps-ng
pkg_version=4.0.4
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --docdir=/usr/share/doc/procps-ng-$pkg_version \
        --disable-static \
        --disable-kill \
        --with-systemd
    make src_w_LDADD='$(LDADD) -lsystemd'
    make -k check
    make install
}
