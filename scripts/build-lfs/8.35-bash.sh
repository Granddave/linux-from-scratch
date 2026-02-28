#!/bin/bash

# The Bash package contains the Bourne-Again Shell.

step_no=8.35
pkg_name=bash
pkg_version=5.2.21
pkg_tar=$pkg_name-$pkg_version.tar.gz

patch_phase() {
    patch -Np1 -i $SOURCES_DIR/bash-5.2.21-upstream_fixes-1.patch
}

build_phase() {
    ./configure \
        --prefix=/usr \
        --without-bash-malloc \
        --with-installed-readline \
        --docdir=/usr/share/doc/bash-5.2.21

    make

    chown -R tester .
    su -s /usr/bin/expect tester <<"EOF"
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF

    make install
    exec /usr/bin/bash --login
}
