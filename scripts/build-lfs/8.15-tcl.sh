#!/bin/bash

# The Tcl package contains the Tool Command Language, a robust general-purpose
# scripting language. The Expect package is written in Tcl (pronounced
# "tickle").

step_no=8.15
pkg_name=tcl
pkg_version=8.6.13
pkg_tar=$pkg_name$pkg_version-src.tar.gz

build_phase() {
    SRCDIR=$(pwd)
    cd unix
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man

    make

    sed -e "s|$SRCDIR/unix|/usr/lib|" \
        -e "s|$SRCDIR|/usr/include|" \
        -i tclConfig.sh

    sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
        -e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|" \
        -e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
        -e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|" \
        -i pkgs/tdbc1.1.5/tdbcConfig.sh

    sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
        -e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|" \
        -e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|" \
        -i pkgs/itcl4.2.3/itclConfig.sh

    unset SRCDIR

    make test
    make install
    chmod -v u+w /usr/lib/libtcl8.6.so
    make install-private-headers
    ln -sfv tclsh8.6 /usr/bin/tclsh
    mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

    # NOTE: Skipping the documentation...
}
