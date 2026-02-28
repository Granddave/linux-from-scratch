#!/bin/bash

# The Acl package contains utilities to administer Access Control Lists, which are used to define fine-grained discretionary access rights for files and directories.

step_no=8.24
pkg_name=acl
pkg_version=2.3.2
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/acl-2.3.2

    make
    make install
}
