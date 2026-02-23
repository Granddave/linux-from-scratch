#!/bin/bash
# The Iana-Etc package provides data for network services and protocols.

step_no=8.4
pkg_name=iana-etc
pkg_tar=iana-etc-20240125.tar.gz

build_phase() {
    cp services protocols /etc
}
