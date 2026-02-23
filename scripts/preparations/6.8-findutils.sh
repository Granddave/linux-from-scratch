#!/bin/bash
set -e
set -x

# The Findutils package contains programs to find files. Programs are provided
# to search through all the files in a directory tree and to create, maintain,
# and search a database (often faster than the recursive find, but unreliable
# unless the database has been updated recently). Findutils also supplies the
# xargs program, which can be used to run a specified command on each file
# selected by a search.

echo "Step 6.8: Build Findutils"

step_no=6.8
pkg_name=findutils
pkg_version=4.9.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --localstatedir=/var/lib/locate \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make
    make DESTDIR=$LFS install
}
