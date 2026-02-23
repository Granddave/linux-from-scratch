#!/bin/bash
set -e
set -x

# The Ncurses package contains libraries for terminal-independent handling of
# character screens.

echo "Step 6.3: Build Ncurses"
step_no=6.3
pkg_name=ncurses
pkg_version=6.4-20230520
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i s/mawk// configure
}

build_phase() {
    mkdir build
    pushd build
    ../configure
    make -C include
    make -C progs tic
    popd # build

    ./configure \
        --prefix=/usr \
        --host=$LFS_TGT \
        --build=$(./config.guess) \
        --mandir=/usr/share/man \
        --with-manpage-format=normal \
        --with-shared \
        --without-normal \
        --with-cxx-shared \
        --without-debug \
        --without-ada \
        --disable-stripping \
        --enable-widec
    make
    make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
    ln -sv libncursesw.so $LFS/usr/lib/libncurses.so
    sed -e 's/^#if.*XOPEN.*$/#if 1/' \
        -i $LFS/usr/include/curses.h
}
