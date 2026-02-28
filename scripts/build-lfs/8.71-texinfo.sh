#!/bin/bash

# The Texinfo package contains programs for reading, writing, and converting
# info pages.

step_no=8.71
pkg_name=texinfo
pkg_version=7.1
pkg_tar=$pkg_name-$pkg_version.tar.xz

# patch_phase() {
# }

build_phase() {
    ./configure --prefix=/usr
    make
    make check
    make install
    make TEXMF=/usr/share/texmf install-tex

    pushd /usr/share/info
    rm -v dir
    for f in *; do
        install-info $f dir 2>/dev/null
    done
    popd
}
