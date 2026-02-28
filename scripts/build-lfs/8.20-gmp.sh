#!/bin/bash

# The GMP package contains math libraries. These have useful functions for
# arbitrary precision arithmetic.

step_no=8.20
pkg_name=gmp
pkg_version=6.3.0
pkg_tar=gmp-6.3.0.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --enable-cxx \
        --disable-static \
        --docdir=/usr/share/doc/gmp-6.3.0

    make
    make html

    make check 2>&1 | tee gmp-check-log

    # Ensure that at least 199 tests in the test suite passed.
    PASSING_TESTS=$(awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log)
    if [ "$PASSING_TESTS" -lt 199 ]; then
        echo "Error: Only $PASSING_TESTS tests passed. Expected at least 199."
        exit 1
    fi

    make install
    make install-html
}
