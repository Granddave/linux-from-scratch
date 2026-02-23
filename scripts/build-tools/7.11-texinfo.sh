# The Texinfo package contains programs for reading, writing, and converting
# info pages.

step_no=7.11
pkg_name=texinfo
pkg_version=7.1
pkg_tar=$pkg_name-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr
    make
    make install
}
