#!/bin/bash

# The GRUB package contains the GRand Unified Bootloader.

step_no=8.63
pkg_name=grub
pkg_version=2.12
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    echo depends bli part_gpt >grub-core/extra_deps.lst
}

build_phase() {
    unset {C,CPP,CXX,LD}FLAGS
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-efiemu \
        --disable-werror

    make
    make install
    mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
}
