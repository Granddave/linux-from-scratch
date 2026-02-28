#!/bin/bash

# Jinja2 is a Python module that implements a simple pythonic template
# language.

step_no=8.74
pkg_name=Jinja2
pkg_version=3.1.3
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
    pip3 install --no-index --no-user --find-links dist Jinja2
}
