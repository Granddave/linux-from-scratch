# The Bison package contains a parser generator.

step_no=7.8
pkg_name=bison
src_tar=bison-3.8.2.tar.xz

build() {
    ./configure \
        --prefix=/usr \
        --docdir=/usr/share/doc/bison-3.8.2
    make
    make install
}
