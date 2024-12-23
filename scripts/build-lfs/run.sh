#!/bin/bash
set -euo pipefail

echo "Step 8: Build the LFS System"
sudo chroot "$LFS" /usr/bin/env -i \
    HOME=/root                     \
    TERM="$TERM"                   \
    PS1='(lfs chroot) \u:\w\$ '    \
    PATH=/usr/bin:/usr/sbin        \
    MAKEFLAGS="-j$(nproc)"         \
    TESTSUITEFLAGS="-j$(nproc)"    \
    /bin/bash --login +h           \
    -c "sh /scripts/build-lfs/run-chroot.sh"
