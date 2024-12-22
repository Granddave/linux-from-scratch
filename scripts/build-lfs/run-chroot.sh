#!/bin/bash
set -euo pipefail

# Run in chroot as root

sh /scripts/build-lfs/8.3-man-pages.sh
sh /scripts/build-lfs/8.4-iana-etc.sh

# TODO: https://www.linuxfromscratch.org/lfs/view/12.1-systemd/chapter08/glibc.html
# and onward
