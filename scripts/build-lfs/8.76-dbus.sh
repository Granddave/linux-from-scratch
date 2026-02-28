#!/bin/bash

# D-Bus is a message bus system, a simple way for applications to talk to one
# another. D-Bus supplies both a system daemon (for events such as "new
# hardware device added" or "printer queue changed") and a
# per-user-login-session daemon (for general IPC needs among user
# applications). Also, the message bus is built on top of a general one-to-one
# message passing framework, which can be used by any two applications to
# communicate directly (without going through the message bus daemon).

step_no=8.76
pkg_name=dbus
pkg_version=1.14.10
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --runstatedir=/run \
        --enable-user-session \
        --disable-static \
        --disable-doxygen-docs \
        --disable-xml-docs \
        --docdir=/usr/share/doc/dbus-1.14.10 \
        --with-system-socket=/run/dbus/system_bus_socket

    make
    make check
    make install
    ln -sfv /etc/machine-id /var/lib/dbus
}
