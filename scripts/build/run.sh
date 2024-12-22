#!/bin/bash
set -euo pipefail

sudo sh $LFS/scripts/build/7.2-change-ownership.sh
sudo sh $LFS/scripts/build/7.3-prepare-vfs.sh

echo "Step 7.4: Build the LFS System"
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login +h        \
    -c "sh /scripts/build/run-chroot.sh"
