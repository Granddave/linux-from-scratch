#!/bin/bash

# Meson is an open source build system designed to be both extremely fast and
# as user friendly as possible.

step_no=8.56
pkg_name=meson
pkg_version=1.3.2
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

    pip3 install --no-index --find-links dist meson
    install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
    install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson
}
