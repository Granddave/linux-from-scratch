#!/bin/bash

# The Inetutils package contains programs for basic networking.

step_no=8.40
pkg_name=inetutils
pkg_version=2.5
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --bindir=/usr/bin \
        --localstatedir=/var \
        --disable-logger \
        --disable-whois \
        --disable-rcp \
        --disable-rexec \
        --disable-rlogin \
        --disable-rsh \
        --disable-servers
    make
    make check
    make install
    mv -v /usr/{,s}bin/ifconfig
}
