#!/bin/bash
set -e
set -x

# The Bash package contains the Bourne-Again Shell.

tar -xf bash-5.2.21.tar.gz -C /tmp/
mv /tmp/bash-* /tmp/bash

pushd /tmp/bash

./configure \
    --prefix=/usr \
    --build=$(sh support/config.guess) \
    --host=$LFS_TGT \
    --without-bash-malloc
make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

popd # /tmp/bash
