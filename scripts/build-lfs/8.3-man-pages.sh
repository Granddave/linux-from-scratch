#!/bin/bash
# The Man-pages package contains over 2,400 man pages.

step_no=8.3
pkg_name=man-pages
pkg_tar=man-pages-6.06.tar.xz

build_phase() {
    rm -v man3/crypt*
    make prefix=/usr install
}
