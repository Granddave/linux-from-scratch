#!/bin/bash
set -e
set -x

# The GCC package contains the GNU compiler collection, which includes the C
# and C++ compilers.

tar -xf gcc-13.2.0.tar.xz -C /tmp/
mv /tmp/gcc-* /tmp/gcc-pass2

# GCC dependencies
tar -xf mpfr-4.2.1.tar.xz -C /tmp/
mv -v /tmp/mpfr-* /tmp/gcc-pass2/mpfr
tar -xf gmp-6.3.0.tar.xz -C /tmp/
mv -v /tmp/gmp-* /tmp/gcc-pass2/gmp
tar -xf mpc-1.3.1.tar.gz -C /tmp/
mv -v /tmp/mpc-* /tmp/gcc-pass2/mpc

pushd /tmp/gcc-pass2

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

popd # /tmp/gcc-pass2
