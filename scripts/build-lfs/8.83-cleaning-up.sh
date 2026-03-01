#!/bin/bash

set -ex

rm -rf /tmp/*
find /usr/lib /usr/libexec -name \*.la -delete

# Remove temporary tools. They are no longer needed and take up space.
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf

userdel -r tester || true
groupdel tester || true
