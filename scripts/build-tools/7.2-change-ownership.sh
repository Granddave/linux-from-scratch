#!/bin/bash
set -euo pipefail
set -x

# Change Ownership
step_no=7.12

build_phase() {
    chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
    case $(uname -m) in
      x86_64) chown -R root:root $LFS/lib64 ;;
    esac
}
