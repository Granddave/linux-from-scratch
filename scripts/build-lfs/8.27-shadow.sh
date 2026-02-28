#!/bin/bash

# The Shadow package contains programs for handling passwords in a secure way.

step_no=8.27
pkg_name=shadow
pkg_version=4.14.5
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i 's/groups$(EXEEXT) //' src/Makefile.in
    find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
    find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
    find man -name Makefile.in -exec sed -i 's/passwd\.5 / /' {} \;

    sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
        -e 's:/var/spool/mail:/var/mail:' \
        -e '/PATH=/{s@/sbin:@@;s@/bin:@@}' \
        -i etc/login.defs
}

build_phase() {
    touch /usr/bin/passwd
    ./configure \
        --sysconfdir=/etc \
        --disable-static \
        --with-{b,yes}crypt \
        --without-libbsd \
        --with-group-name-max-length=32

    make
    make exec_prefix=/usr install
    make -C man install-man

    # Configuration
    pwconv
    grpconv
    mkdir -p /etc/default
    useradd -D --gid 999

    # set a default root password to 'root' programatically instead of the
    # `passwd root` suggested in the manual
    echo root:root | chpasswd
}
