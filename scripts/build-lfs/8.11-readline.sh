#!/bin/bash

# The Readline package is a set of libraries that offer command-line editing
# and history capabilities.

step_no=8.11
pkg_name=readline
pkg_version=8.2
pkg_tar=$pkg_name-$pkg_version.tar.gz

patch_phase() {
    sed -i '/MV.*old/d' Makefile.in
    sed -i '/{OLDSUFF}/c:' support/shlib-install
    patch -Np1 -i $SOURCES_DIR/readline-8.2-upstream_fixes-3.patch
}

build_phase() {
    ./configure \
        --prefix=/usr \
        --disable-static \
        --with-curses \
        --docdir=/usr/share/doc/readline-8.2
    make SHLIB_LIBS="-lncursesw"
    make SHLIB_LIBS="-lncursesw" install
    install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.2
}
