#!/bin/bash

# Setuptools is a tool used to download, build, install, upgrade, and uninstall
# Python packages.

step_no=8.54
pkg_name=setuptools
pkg_version=69.1.0
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist setuptools
}
