#!/bin/bash
set -euo pipefail
set -x

# Execute as LFS

export SOURCES_DIR=$LFS/sources

# sh $LFS/scripts/preparations/run.sh
# sh $LFS/scripts/build-tools/run.sh
sh $LFS/scripts/build-lfs/run.sh
