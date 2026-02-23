# The Texinfo package contains programs for reading, writing, and converting
# info pages.

step_no=7.11
pkg_name=texinfo
pkg_tar=texinfo-7.1.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr
    make
    make install
}
