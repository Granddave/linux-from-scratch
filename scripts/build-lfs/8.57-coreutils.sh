#!/bin/bash

# The Coreutils package contains the basic utility programs needed by every
# operating system.

step_no=8.57
pkg_name=coreutils
pkg_version=9.4
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    patch -Np1 -i $SOURCES_DIR/coreutils-9.4-i18n-1.patch
    sed -e '/n_out += n_hold/,+4 s|.*bufsize.*|//&|' \
        -i src/split.c
}

build_phase() {
    autoreconf -fiv
    FORCE_UNSAFE_CONFIGURE=1 ./configure \
        --prefix=/usr \
        --enable-no-install-program=kill,uptime

    # From https://www.linuxfromscratch.org/lfs/errata/12.1/ :
    # > In Coreutils test suite, two test named test-getlogin and
    # > test/tty/tty.sh are known to fail but they are not noted in the book.
    # > They can be suppressed by redirecting the standard input when running the
    # > test suite.
    make NON_ROOT_USERNAME=tester check-root || true
    groupadd -g 102 dummy -U tester || true
    chown -R tester .
    su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check" || true
    groupdel dummy

    make install

    mv -v /usr/bin/chroot /usr/sbin
    mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
    sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
}
