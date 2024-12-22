#!/bin/bash
set -euo pipefail
set -x

echo "Step 7.2: Change Ownership"

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -R root:root $LFS/lib64 ;;
esac
