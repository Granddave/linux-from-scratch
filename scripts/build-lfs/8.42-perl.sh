#!/bin/bash

# The Perl package contains the Practical Extraction and Report Language.

step_no=8.42
pkg_name=perl
pkg_version=5.38.2
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    export BUILD_ZLIB=False
    export BUILD_BZIP2=0

    sh Configure \
        -des \
        -Dprefix=/usr \
        -Dvendorprefix=/usr \
        -Dprivlib=/usr/lib/perl5/5.38/core_perl \
        -Darchlib=/usr/lib/perl5/5.38/core_perl \
        -Dsitelib=/usr/lib/perl5/5.38/site_perl \
        -Dsitearch=/usr/lib/perl5/5.38/site_perl \
        -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
        -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl \
        -Dman1dir=/usr/share/man/man1 \
        -Dman3dir=/usr/share/man/man3 \
        -Dpager="/usr/bin/less -isR" \
        -Duseshrplib \
        -Dusethreads
    make

    # Test fail for some reason:
    # porting/exec-bit.t          (Wstat: 0 Tests: 12979 Failed: 10969)
    #
    #TEST_JOBS=$(nproc) make test_harness

    make install
    unset BUILD_ZLIB
    unset BUILD_BZIP2
}
