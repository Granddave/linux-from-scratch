#!/bin/bash

# The Tar package provides the ability to create tar archives as well as
# perform various other kinds of archive manipulation. Tar can be used on
# previously created archives to extract files, to store additional files, or
# to update or list files which were already stored.

step_no=8.70
pkg_name=tar
pkg_version=1.35
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    FORCE_UNSAFE_CONFIGURE=1 \
        ./configure --prefix=/usr
    make
    # > One test, capabilities: binary store/restore, is known to fail if it is
    # > run because LFS lacks selinux, but will be skipped if the host kernel
    # > does not support extended attributes or security labels on the filesystem
    # > used for building LFS.
    # make check || true
    make install
    make -C doc install-html docdir=/usr/share/doc/tar-1.35
}
