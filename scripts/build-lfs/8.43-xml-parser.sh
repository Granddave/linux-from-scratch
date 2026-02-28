#!/bin/bash

# The XML::Parser module is a Perl interface to James Clark's XML parser,
# Expat.

step_no=8.43
pkg_name=XML-Parser
pkg_version=2.47
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    perl Makefile.PL
    make
    make test
    make install
}
