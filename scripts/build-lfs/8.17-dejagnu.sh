#!/bin/bash

# The DejaGnu package contains a framework for running test suites on GNU
# tools. It is written in expect, which itself uses Tcl (Tool Command
# Language).

step_no=8.17
pkg_name=dejagnu
pkg_version=1.6.3
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    mkdir -v build
    cd build

    ../configure --prefix=/usr
    makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
    makeinfo --plaintext -o doc/dejagnu.txt ../doc/dejagnu.texi

    make check

    make install
    install -v -dm755 /usr/share/doc/dejagnu-1.6.3
    install -v -m644 doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3
}
