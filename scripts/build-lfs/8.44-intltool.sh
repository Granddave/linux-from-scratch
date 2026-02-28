#!/bin/bash

# The Intltool is an internationalization tool used for extracting translatable
# strings from source files.

step_no=8.44
pkg_name=intltool
pkg_version=0.51.0
pkg_tar=$pkg_name-$pkg_version.tar.gz

patch_phase() {
    sed -i 's:\\\${:\\\$\\{:' intltool-update.in
}

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
    install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-$pkg_version/I18N-HOWTO
}
