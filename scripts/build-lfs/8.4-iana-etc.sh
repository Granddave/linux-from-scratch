#!/bin/bash
# The Iana-Etc package provides data for network services and protocols.

step_no=8.4
pkg_name=iana-etc
pkg_version=20240125
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    cp services protocols /etc
}
