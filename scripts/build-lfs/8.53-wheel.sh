#!/bin/bash

# Wheel is a Python library that is the reference implementation of the Python
# wheel packaging standard.

step_no=8.53
pkg_name=wheel
pkg_version=0.42.0
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links=dist wheel
}
