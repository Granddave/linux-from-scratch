#!/bin/bash
# The Bzip2 package contains programs for compressing and decompressing files.
# Compressing text files with bzip2 yields a much better compression percentage
# than with the traditional gzip.

step_no=8.7
pkg_name=bzip2
pkg_version=1.0.8
pkg_tar=$pkg_name-$pkg_version.tar.gz

patch_phase() {
    patch -Np1 -i $SOURCES_DIR/bzip2-1.0.8-install_docs-1.patch
    sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
    sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
}

build_phase() {
    make -f Makefile-libbz2_so
    make clean

    make
    make PREFIX=/usr install

    cp -av libbz2.so.* /usr/lib
    ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so

    cp -v bzip2-shared /usr/bin/bzip2
    for i in /usr/bin/{bzcat,bunzip2}; do
        ln -sfv bzip2 $i
    done

    rm -fv /usr/lib/libbz2.a
}
