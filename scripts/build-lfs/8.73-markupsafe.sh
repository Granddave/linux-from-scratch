#!/bin/bash

# MarkupSafe is a Python module that implements an XML/HTML/XHTML Markup safe
# string.

step_no=8.73
pkg_name=MarkupSafe
pkg_version=2.1.5
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
    pip3 install --no-index --no-user --find-links dist Markupsafe
}
