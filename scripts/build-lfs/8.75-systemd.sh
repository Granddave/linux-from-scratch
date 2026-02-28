#!/bin/bash

# The systemd package contains programs for controlling the startup, running,
# and shutdown of the system.

step_no=8.75
pkg_name=systemd
pkg_version=255
pkg_tar=$pkg_name-$pkg_version.tar.gz

patch_phase() {
    sed -i -e 's/GROUP="render"/GROUP="video"/' \
        -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
    patch -Np1 -i $SOURCES_DIR/systemd-255-upstream_fixes-1.patch
}

build_phase() {
    mkdir -p build
    cd build

    meson setup \
        --prefix=/usr \
        --buildtype=release \
        -Ddefault-dnssec=no \
        -Dfirstboot=false \
        -Dinstall-tests=false \
        -Dldconfig=false \
        -Dsysusers=false \
        -Drpmmacrosdir=no \
        -Dhomed=disabled \
        -Duserdb=false \
        -Dman=disabled \
        -Dmode=release \
        -Dpamconfdir=no \
        -Ddev-kvm-mode=0660 \
        -Dnobody-group=nogroup \
        -Dsysupdate=disabled \
        -Dukify=disabled \
        -Ddocdir=/usr/share/doc/systemd-$pkg_version \
        ..

    ninja

    ninja install
    tar -xf $SOURCES_DIR/systemd-man-pages-$pkg_version.tar.xz \
        --no-same-owner --strip-components=1 \
        -C /usr/share/man
    systemd-machine-id-setup
    systemctl preset-all
}
