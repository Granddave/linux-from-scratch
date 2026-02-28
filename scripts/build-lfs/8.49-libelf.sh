#!/bin/bash

# Libelf is a library for handling ELF (Executable and Linkable Format) files.

step_no=8.49
pkg_name=elfutils  # libelf is part of the elfutils package
pkg_version=0.190
pkg_tar=pkg_name-$pkg_version.tar.bz2

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-debuginfod \
        --enable-libdebuginfod=dummy
    make

    make check

    make -C libelf install
    install -vm644 config/libelf.pc /usr/lib/pkgconfig
    rm /usr/lib/libelf.a
}
