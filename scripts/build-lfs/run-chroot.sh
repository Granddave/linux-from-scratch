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
# sh /scripts/builder.sh /scripts/build-lfs/8.21-mpfr.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.22-mpc.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.23-attr.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.24-acl.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.25-libcap.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.26-libxcrypt.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.27-shadow.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.28-gcc.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.29-ncurses.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.30-sed.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.31-psmisc.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.32-gettext.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.33-bison.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.34-grep.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.35-bash.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.36-libtool.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.37-gdbm.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.38-gperf.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.39-expat.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.40-inetutils.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.41-less.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.42-perl.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.43-xml-parser.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.44-intltool.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.45-autoconf.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.46-automake.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.47-openssl.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.48-kmod.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.49-libelf.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.50-libffi.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.51-python.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.52-flit-core.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.53-wheel.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.54-setuptools.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.55-ninja.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.56-meson.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.57-coreutils.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.58-check.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.59-diffutils.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.60-gawk.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.61-findutils.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.62-groff.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.63-grub.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.64-gzip.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.65-iproute2.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.66-kbd.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.67-libpipeline.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.68-make.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.69-patch.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.70-tar.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.71-texinfo.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.72-vim.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.73-markupsafe.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.74-jinja2.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.75-systemd.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.76-dbus.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.77-man-db.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.78-procps-ng.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.79-util-linux.sh
# sh /scripts/builder.sh /scripts/build-lfs/8.80-e2fsprogs.sh
