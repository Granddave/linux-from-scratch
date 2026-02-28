#!/bin/bash

# The Gawk package contains programs for manipulating text files.

step_no=8.60
pkg_name=gawk
pkg_version=5.3.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i 's/extras//' Makefile.in
}

build_phase() {
    ./configure --prefix=/usr
    make
    chown -R tester .
    su tester -c "PATH=$PATH make check"

    # Removes gawk from chapter 6.9
    rm -f /usr/bin/gawk-5.3.0
    make install

    ln -sv gawk.1 /usr/share/man/man1/awk.1
}
