# The Python 3 package contains the Python development environment. It is
# useful for object-oriented programming, writing scripts, prototyping large
# programs, and developing entire applications. Python is an interpreted
# computer language.

step_no=7.10
pkg_name=python
pkg_version=3.12.2
pkg_tar=Python-$pkg_version.tar.xz

build_phase() {
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --without-ensurepip
    make
    make install
}
