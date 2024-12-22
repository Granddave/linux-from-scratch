#!/bin/bash
set -euo pipefail

# Run in chroot as root

sh /scripts/build/7.5-create-dirs.sh
sh /scripts/build/7.6-create-files.sh
sh /scripts/build/7.7-gettext.sh
sh /scripts/build/7.8-bison.sh
sh /scripts/build/7.9-perl.sh
sh /scripts/build/7.10-python.sh
sh /scripts/build/7.11-texinfo.sh
sh /scripts/build/7.12-util-linux.sh

echo "7.13: Cleaning Up"
rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete

# Skip for now
#rm -rf /tools
