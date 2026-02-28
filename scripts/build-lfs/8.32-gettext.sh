#!/bin/bash

# The Gettext package contains utilities for internationalization and
# localization. These allow programs to be compiled with NLS (Native Language
# Support), enabling them to output messages in the user's native language.

step_no=8.32
pkg_name=gettext
pkg_version=0.22.4
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/gettext-0.22.4

    make
    make check
    make install
    chmod -v 0755 /usr/lib/preloadable_libintl.so
}
