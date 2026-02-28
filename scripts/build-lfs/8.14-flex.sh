#!/bin/bash

# The Flex package contains a utility for generating programs that recognize
# patterns in text.

step_no=8.14
pkg_name=flex
pkg_version=2.6.4
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./configure \
        --prefix=/usr \
        --docdir=/usr/share/doc/flex-2.6.4 \
        --disable-static
    make
    make check
    make install
    ln -sv flex /usr/bin/lex
    ln -sv flex.1 /usr/share/man/man1/lex.1
}
