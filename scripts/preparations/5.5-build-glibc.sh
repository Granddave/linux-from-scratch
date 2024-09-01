#!/bin/bash
set -e
set -x

# The Glibc package contains the main C library. This library provides the
# basic routines for allocating memory, searching directories, opening and
# closing files, reading and writing files, string handling, pattern matching,
# arithmetic, and so on.

tar -xf glibc-2.39.tar.xz -C /tmp/
mv /tmp/glibc-* /tmp/glibc
cp glibc-2.39-fhs-1.patch /tmp/

pushd /tmp/glibc

case $(uname -m) in
i?86)
    ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
x86_64)
    ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
    ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-2.39-fhs-1.patch
mkdir -v build
pushd build
echo "rootsbindir=/usr/sbin" >configparms
../configure \
    --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(../scripts/config.guess) \
    --enable-kernel=4.19 \
    --with-headers=$LFS/usr/include \
    --disable-nscd \
    libc_cv_slibdir=/usr/lib
make
make DESTDIR=$LFS install
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
popd # build

# Make sure we can compile programs against the new glibc
echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux
rm -v a.out

popd # /tmp/glibc
