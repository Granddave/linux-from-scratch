#!/bin/bash
set -e
set -x

pushd $LFS/sources

if [ -f .lfs_fetched ]; then
    echo "Already fetched the sources"
    exit 0
fi

# Fetch the sources
wget https://www.linuxfromscratch.org/lfs/view/$LFS_VERSION/wget-list-systemd
patch < $LFS/scripts/packages/wget-list-systemd.patch
wget --input-file=wget-list-systemd --continue --directory-prefix=$LFS/sources

# Verify the downloaded sources
wget https://www.linuxfromscratch.org/lfs/view/$LFS_VERSION/md5sums
patch < $LFS/scripts/packages/md5sums.patch
md5sum -c md5sums

chown root:root $LFS/sources/*

touch .lfs_fetched

popd
