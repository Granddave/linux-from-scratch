#!/bin/bash

# The Attr package contains utilities to administer the extended attributes of
# filesystem objects.

step_no=8.23
pkg_name=attr
pkg_version=2.5.2
pkg_tar=$pkg_name-$pkg_version.tar.gz

# patch_phase() {
# }

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --sysconfdir=/etc \
        --docdir=/usr/share/doc/attr-2.5.2

    make
    make check
    make install
}
