#!/bin/bash

# The Expect package contains tools for automating, via scripted dialogues,
# interactive applications such as telnet, ftp, passwd, fsck, rlogin, and tip.
# Expect is also useful for testing these same applications as well as easing
# all sorts of tasks that are prohibitively difficult with anything else. The
# DejaGnu framework is written in Expect.

step_no=8.16
pkg_name=expect
pkg_version=5.45.4
pkg_tar=$pkg_name$pkg_version.tar.gz

build_phase() {
    python3 -c 'from pty import spawn; spawn(["echo", "ok"])'

    ./configure \
        --prefix=/usr \
        --with-tcl=/usr/lib \
        --enable-shared \
        --mandir=/usr/share/man \
        --with-tclinclude=/usr/include

    make
    make test
    make install
    ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
}
