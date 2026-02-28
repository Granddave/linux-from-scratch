#!/bin/bash

# The Libffi library provides a portable, high level programming interface to
# various calling conventions. This allows a programmer to call any function
# specified by a call interface description at run time.

# FFI stands for Foreign Function Interface. An FFI allows a program written in
# one language to call a program written in another language. Specifically,
# Libffi can provide a bridge between an interpreter like Perl, or Python, and
# shared library subroutines written in C, or C++.

step_no=8.50
pkg_name=libffi
pkg_version=3.4.4
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --with-gcc-arch=native
    make
    make check
    make install
}
