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
sh /scripts/builder.sh /scripts/build-lfs/8.20-gmp.sh
sh /scripts/builder.sh /scripts/build-lfs/8.21-mpfr.sh
sh /scripts/builder.sh /scripts/build-lfs/8.22-mpc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.23-attr.sh
sh /scripts/builder.sh /scripts/build-lfs/8.24-acl.sh
sh /scripts/builder.sh /scripts/build-lfs/8.25-libcap.sh
sh /scripts/builder.sh /scripts/build-lfs/8.26-libxcrypt.sh
sh /scripts/builder.sh /scripts/build-lfs/8.27-shadow.sh
sh /scripts/builder.sh /scripts/build-lfs/8.28-gcc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.29-ncurses.sh
sh /scripts/builder.sh /scripts/build-lfs/8.30-sed.sh
sh /scripts/builder.sh /scripts/build-lfs/8.31-psmisc.sh
sh /scripts/builder.sh /scripts/build-lfs/8.32-gettext.sh
sh /scripts/builder.sh /scripts/build-lfs/8.33-bison.sh
sh /scripts/builder.sh /scripts/build-lfs/8.34-grep.sh
sh /scripts/builder.sh /scripts/build-lfs/8.35-bash.sh
