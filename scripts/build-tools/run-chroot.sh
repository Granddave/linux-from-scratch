#!/bin/bash
set -euo pipefail

# Run in chroot as root

export SOURCES_DIR=/sources

sh /scripts/build-tools/7.5-create-dirs.sh
sh /scripts/build-tools/7.6-create-files.sh
sh /scripts/builder.sh /scripts/build-tools/7.7-gettext.sh
sh /scripts/builder.sh /scripts/build-tools/7.8-bison.sh
sh /scripts/builder.sh /scripts/build-tools/7.9-perl.sh
sh /scripts/builder.sh /scripts/build-tools/7.10-python.sh
sh /scripts/builder.sh /scripts/build-tools/7.11-texinfo.sh
sh /scripts/builder.sh /scripts/build-tools/7.12-util-linux.sh
sh /scripts/builder.sh /scripts/build-tools/7.13-cleaning-up.sh

# Skip for now
#rm -rf /tools
