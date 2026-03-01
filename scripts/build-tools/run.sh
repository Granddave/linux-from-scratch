#!/bin/bash
set -euo pipefail

export SOURCES_DIR=$LFS/sources

sudo --preserve-env=SOURCES_DIR sh $LFS/scripts/builder.sh $LFS/scripts/build-tools/7.2-change-ownership.sh

# This needs to be run for every new docker runner:
sudo --preserve-env=SOURCES_DIR sh $LFS/scripts/builder.sh $LFS/scripts/build-tools/7.3-prepare-vfs.sh

echo "Step 7.4: Build the LFS base"
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login +h        \
    -c "sh /scripts/build-tools/run-chroot.sh"
