#!/bin/bash
set -e
set -x

# The GCC package contains the GNU compiler collection, which includes the C and C++ compilers.

tar -xf gcc-13.2.0.tar.xz -C /tmp/
mv /tmp/gcc-* /tmp/gcc

# GCC dependencies
tar -xf mpfr-4.2.1.tar.xz -C /tmp/
mv -v /tmp/mpfr-* /tmp/gcc/mpfr
tar -xf gmp-6.3.0.tar.xz -C /tmp/
mv -v /tmp/gmp-* /tmp/gcc/gmp
tar -xf mpc-1.3.1.tar.gz -C /tmp/
mv -v /tmp/mpc-* /tmp/gcc/mpc

pushd /tmp/gcc

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
