#!/bin/bash
set -euo pipefail
set -x

# Prepare Virtual Kernel File Systems
step_no=7.3

build_phase() {
    mkdir -pv $LFS/{dev,proc,sys,run}

    mount -v --bind /dev $LFS/dev

    # NOTE: `,ptmxmode=0666` is added because of issues with GCC test suite
    #       when running as 'tester' user
    mount -vt devpts devpts -o gid=5,mode=0620,ptmxmode=0666 $LFS/dev/pts
    mount -vt proc proc $LFS/proc
    mount -vt sysfs sysfs $LFS/sys
    mount -vt tmpfs tmpfs $LFS/run

    if [ -h $LFS/dev/shm ]; then
        install -v -d -m 1777 $LFS$(realpath /dev/shm)
    else
        mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
    fi
}
