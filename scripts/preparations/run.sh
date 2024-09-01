#!/bin/bash

sudo sh $LFS/scripts/preparations/4.2-create-rootfs-dirs.sh
sudo sh $LFS/scripts/preparations/4.3-lfs-user-perm.sh
sh $LFS/scripts/preparations/5.2-build-binutils.sh
sh $LFS/scripts/preparations/5.3-build-gcc.sh
sh $LFS/scripts/preparations/5.4-build-linux-headers.sh
sh $LFS/scripts/preparations/5.5-build-glibc.sh
sh $LFS/scripts/preparations/5.6-build-libstdc++.sh
