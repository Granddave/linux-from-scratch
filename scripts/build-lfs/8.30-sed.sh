#!/bin/bash

# The Sed package contains a stream editor.

step_no=8.30
pkg_name=sed
pkg_version=4.9
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr

    make
    make html

    chown -R tester .
    su tester -c "PATH=$PATH make check"

    make install
    install -d -m755 /usr/share/doc/sed-4.9
    install -m644 doc/sed.html /usr/share/doc/sed-4.9
}
