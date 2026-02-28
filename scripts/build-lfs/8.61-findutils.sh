#!/bin/bash

# The Findutils package contains programs to find files. Programs are provided
# to search through all the files in a directory tree and to create, maintain,
# and search a database (often faster than the recursive find, but unreliable
# unless the database has been updated recently). Findutils also supplies the
# xargs program, which can be used to run a specified command on each file
# selected by a search.

step_no=8.61
pkg_name=findutils
pkg_version=4.9.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure --prefix=/usr --localstatedir=/var/lib/locate
    make

    chown -R tester .
    su tester -c "PATH=$PATH make check"

    make install
}
