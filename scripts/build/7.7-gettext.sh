#!/bin/bash
set -euo pipefail
set -x

# The Gettext package contains utilities for internationalization and
# localization. These allow programs to be compiled with NLS (Native Language
# Support), enabling them to output messages in the user's native language.

echo "Step 7.7: Build gettext"

tar -xf /sources/gettext-0.22.4.tar.xz -C /tmp/
mv /tmp/gettext-* /tmp/gettext

pushd /tmp/gettext

./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

popd # /tmp/gettext
