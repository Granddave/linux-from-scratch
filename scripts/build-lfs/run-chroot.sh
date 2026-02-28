#!/bin/bash
set -euo pipefail

# Run in chroot as root

export SOURCES_DIR=/sources

sh /scripts/builder.sh /scripts/build-lfs/8.3-man-pages.sh
sh /scripts/builder.sh /scripts/build-lfs/8.4-iana-etc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.5-glibc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.6-zlib.sh
sh /scripts/builder.sh /scripts/build-lfs/8.7-bzip2.sh
sh /scripts/builder.sh /scripts/build-lfs/8.8-xz.sh
sh /scripts/builder.sh /scripts/build-lfs/8.9-zstd.sh
sh /scripts/builder.sh /scripts/build-lfs/8.10-file.sh
sh /scripts/builder.sh /scripts/build-lfs/8.11-readline.sh
sh /scripts/builder.sh /scripts/build-lfs/8.12-m4.sh
sh /scripts/builder.sh /scripts/build-lfs/8.13-bc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.14-flex.sh
sh /scripts/builder.sh /scripts/build-lfs/8.15-tcl.sh
sh /scripts/builder.sh /scripts/build-lfs/8.16-expect.sh
sh /scripts/builder.sh /scripts/build-lfs/8.17-dejagnu.sh
sh /scripts/builder.sh /scripts/build-lfs/8.18-pkgconf.sh
sh /scripts/builder.sh /scripts/build-lfs/8.19-binutils.sh
