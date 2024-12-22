#!/bin/bash
set -euo pipefail
set -x

# Execute as LFS

sh $LFS/scripts/preparations/run.sh
sh $LFS/scripts/build/run.sh
