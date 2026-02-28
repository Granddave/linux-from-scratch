#!/bin/bash

# The Kbd package contains key-table files, console fonts, and keyboard
# utilities.

step_no=8.66
pkg_name=kbd
pkg_version=2.6.4
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    patch -Np1 -i $SOURCES_DIR/kbd-2.6.4-backspace-1.patch
    sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
}

build_phase() {
    ./configure --prefix=/usr --disable-vlock
    make
    make check
    make install
}
