#!/bin/bash
set -e
set -x

# Libstdc++ is the standard C++ library. It is needed to compile C++ code (part
# of GCC is written in C++), but we had to defer its installation when we built
# gcc-pass1 because Libstdc++ depends on Glibc, which was not yet available in
# the target directory.

tar -xf gcc-13.2.0.tar.xz -C /tmp/
mv /tmp/gcc-* /tmp/libstdc++

pushd /tmp/libstdc++

mkdir -v build
pushd build

../libstdc++-v3/configure \
    --host=$LFS_TGT \
    --build=$(../config.guess) \
    --prefix=/usr \
    --disable-multilib \
    --disable-nls \
    --disable-libstdcxx-pch \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/13.2.0
make
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/lib{stdc++{,exp,fs},supc++}.la

popd # build
popd # /tmp/libstdc++
