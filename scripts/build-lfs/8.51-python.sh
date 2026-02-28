#!/bin/bash

# The Python 3 package contains the Python development environment. It is
# useful for object-oriented programming, writing scripts, prototyping large
# programs, and developing entire applications. Python is an interpreted
# computer language.

step_no=8.51
pkg_name=Python
pkg_version=3.12.2
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --with-system-expat \
        --enable-optimizations
    make
    make install

    cat >/etc/pip.conf <<EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF
}
