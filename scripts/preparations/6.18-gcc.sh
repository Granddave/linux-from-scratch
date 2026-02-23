#!/bin/bash
set -e
set -x

# The GCC package contains the GNU compiler collection, which includes the C
# and C++ compilers.

echo "Step 6.18: Build GCC - Pass 2"
step_no=6.18
pkg_name=gcc
pkg_version=13.2.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    # GCC dependencies
    tar -xf $SOURCES_DIR/mpfr-4.2.1.tar.xz -C $TMP_DIR
    mv -v $TMP_DIR/mpfr-* $BUILD_DIR/mpfr
    tar -xf $SOURCES_DIR/gmp-6.3.0.tar.xz -C $TMP_DIR
    mv -v $TMP_DIR/gmp-* $BUILD_DIR/gmp
    tar -xf $SOURCES_DIR/mpc-1.3.1.tar.gz -C $TMP_DIR
    mv -v $TMP_DIR/mpc-* $BUILD_DIR/mpc
}

build_phase() {
    case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64
        ;;
    esac
    sed '/thread_header =/s/@.*@/gthr-posix.h/' \
        -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

    mkdir -v build
    pushd build

    ../configure \
        --build=$(../config.guess) \
        --host=$LFS_TGT \
        --target=$LFS_TGT \
        LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc \
        --prefix=/usr \
        --with-build-sysroot=$LFS \
        --enable-default-pie \
        --enable-default-ssp \
        --disable-nls \
        --disable-multilib \
        --disable-libatomic \
        --disable-libgomp \
        --disable-libquadmath \
        --disable-libsanitizer \
        --disable-libssp \
        --disable-libvtv \
        --enable-languages=c,c++

    make
    make DESTDIR=$LFS install
    popd # build

    ln -sv gcc $LFS/usr/bin/cc
}
