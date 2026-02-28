#!/bin/bash

# The GDBM package contains the GNU Database Manager. It is a library of
# database functions that uses extensible hashing and works like the standard
# UNIX dbm. The library provides primitives for storing key/data pairs,
# searching and retrieving the data by its key and deleting a key along with
# its data.

step_no=8.37
pkg_name=gdbm
pkg_version=1.23
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --enable-libgdbm-compat
    make
    make check
    make install
}
