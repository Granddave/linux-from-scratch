#!/bin/bash

# The pkgconf package is a successor to pkg-config and contains a tool for
# passing the include path and/or library paths to build tools during the
# configure and make phases of package installations.

step_no=8.18
pkg_name=pkgconf
pkg_version=2.1.1
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/pkgconf-2.1.1

    make
    make install
    ln -sv pkgconf /usr/bin/pkg-config
    ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
}
