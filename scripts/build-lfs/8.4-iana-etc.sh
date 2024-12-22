#!/bin/bash
set -euo pipefail
set -x

# The Iana-Etc package provides data for network services and protocols.

echo "Step 8.4: Build iana-etc"

tar -xf /sources/iana-etc-20240125.tar.gz -C /tmp/
mv /tmp/iana-etc-* /tmp/iana-etc

pushd /tmp/iana-etc

cp services protocols /etc

popd # /tmp/iana-etc
