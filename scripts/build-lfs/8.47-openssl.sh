#!/bin/bash

# The OpenSSL package contains management tools and libraries relating to
# cryptography. These are useful for providing cryptographic functions to other
# packages, such as OpenSSH, email applications, and web browsers (for
# accessing HTTPS sites).
#
step_no=8.47
pkg_name=openssl
pkg_version=3.2.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    ./config \
        --prefix=/usr \
        --openssldir=/etc/ssl \
        --libdir=lib \
        shared \
        zlib-dynamic
    make

    # A test known to fail
    HARNESS_JOBS=$(nproc) make test || true

    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
    make MANSUFFIX=ssl install
    mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.2.1
    cp -vfr doc/* /usr/share/doc/openssl-3.2.1
}
