#!/bin/bash

# The Binutils package contains a linker, an assembler, and other tools for
# handling object files.

step_no=8.19
pkg_name=binutils
pkg_version=2.42
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    mkdir -v build
    cd build

    ../configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-gold \
        --enable-ld=default \
        --enable-plugins \
        --enable-shared \
        --disable-werror \
        --enable-64-bit-bfd \
        --with-system-zlib \
        --enable-default-hash-style=gnu

    make tooldir=/usr

    # > Twelve tests fail in the gold test suite when the --enable-default-pie
    # > and --enable-default-ssp options are passed to GCC. 
    make -k check || true
    FAIL_COUNT=$(grep '^FAIL:' $(find -name '*.log') | wc -l)
    if [ "$FAIL_COUNT" -ne 12 ]; then
        echo "Expected 12 FAILs, but got $FAIL_COUNT"
        exit 1
    fi
    make tooldir=/usr install
    rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
}
