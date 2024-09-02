#!/bin/bash

sudo sh $LFS/scripts/preparations/4.2-create-rootfs-dirs.sh
sudo sh $LFS/scripts/preparations/4.3-lfs-user-perm.sh
sh $LFS/scripts/preparations/5.2-build-binutils.sh
sh $LFS/scripts/preparations/5.3-build-gcc.sh
sh $LFS/scripts/preparations/5.4-build-linux-headers.sh
sh $LFS/scripts/preparations/5.5-build-glibc.sh
sh $LFS/scripts/preparations/5.6-build-libstdc++.sh
sh $LFS/scripts/preparations/6.2-m4.sh
sh $LFS/scripts/preparations/6.3-ncurses.sh
sh $LFS/scripts/preparations/6.4-bash.sh
sh $LFS/scripts/preparations/6.5-coreutils.sh
sh $LFS/scripts/preparations/6.6-diffutils.sh
sh $LFS/scripts/preparations/6.7-file.sh
sh $LFS/scripts/preparations/6.8-findutils.sh
sh $LFS/scripts/preparations/6.9-gawk.sh
sh $LFS/scripts/preparations/6.10-grep.sh
sh $LFS/scripts/preparations/6.11-gzip.sh
sh $LFS/scripts/preparations/6.12-make.sh
sh $LFS/scripts/preparations/6.13-patch.sh
sh $LFS/scripts/preparations/6.14-sed.sh
sh $LFS/scripts/preparations/6.15-tar.sh
sh $LFS/scripts/preparations/6.16-xz.sh
sh $LFS/scripts/preparations/6.17-binutils.sh
sh $LFS/scripts/preparations/6.18-gcc.sh
