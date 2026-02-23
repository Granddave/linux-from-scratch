#!/bin/bash
# The GCC package contains the GNU compiler collection, which includes the C and C++ compilers.

echo "Step 5.3: Build GCC"
step_no=5.3
pkg_name="gcc"
pkg_version="13.2.0"
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

    mkdir -v build
    pushd build
    ../configure \
        --target=$LFS_TGT \
        --prefix=$LFS/tools \
        --with-glibc-version=2.39 \
        --with-sysroot=$LFS \
        --with-newlib \
        --without-headers \
        --enable-default-pie \
        --enable-default-ssp \
        --disable-nls \
        --disable-shared \
        --disable-multilib \
        --disable-threads \
        --disable-libatomic \
        --disable-libgomp \
        --disable-libquadmath \
        --disable-libssp \
        --disable-libvtv \
        --disable-libstdcxx \
        --enable-languages=c,c++
    make
    make install
    popd # build
    cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
        $(dirname $($LFS_TGT-gcc -print-libgcc-file-name))/include/limits.h
}
