#!/bin/bash

# The IPRoute2 package contains programs for basic and advanced IPV4-based
# networking.

step_no=8.65
pkg_name=iproute2
pkg_version=6.7.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    sed -i /ARPD/d Makefile
    rm -fv man/man8/arpd.8
}

build_phase() {
    make NETNS_RUN_DIR=/run/netns
    make SBINDIR=/usr/sbin install
}
