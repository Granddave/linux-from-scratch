#!/bin/bash

# Zstandard is a real-time compression algorithm, providing high compression
# ratios. It offers a very wide range of compression / speed trade-offs, while
# being backed by a very fast decoder.

step_no=8.9
pkg_name=zstd
pkg_version=1.5.5
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    make prefix=/usr
    make check
    make prefix=/usr install
    rm -v /usr/lib/libzstd.a
}
