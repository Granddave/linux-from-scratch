#!/bin/bash
set -euo pipefail

# Run in chroot as root

export SOURCES_DIR=/sources

sh /scripts/builder.sh /scripts/build-lfs/8.3-man-pages.sh
sh /scripts/builder.sh /scripts/build-lfs/8.4-iana-etc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.5-glibc.sh
