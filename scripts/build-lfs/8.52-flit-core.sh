#!/bin/bash

# Flit-core is the distribution-building parts of Flit (a packaging tool for
# simple Python modules).

step_no=8.52
pkg_name=flit_core
pkg_version=3.9.0
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
    pip3 install --no-index --no-user --find-links dist flit_core
}
