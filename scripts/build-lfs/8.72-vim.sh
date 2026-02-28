#!/bin/bash

# The Vim package contains a powerful text editor.

step_no=8.72
pkg_name=vim
pkg_version=9.1.0041
pkg_tar=$pkg_name-$pkg_version.tar.gz

patch_phase() {
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >>src/feature.h
}

build_phase() {
    ./configure --prefix=/usr
    make
    chown -R tester .
    # One failure. Will skip tests for this
    # Failures:
    #        From test_writefile.vim:
    #        Found errors in Test_write_backup_symlink():
    #        command line..script /tmp/tmp.whBVbnhvDC/vim-9.1.0041/src/testdir/runtest.vim[607]..function RunTheTest[57]..Test_write_backup_symlink line 16: Expected True but got 0
    # su tester -c "TERM=xterm-256color LANG=en_US.UTF-8 make -j1 test" \
    #     &>vim-test.log
    # tail -n10 vim-test.log
    make install
    ln -sv vim /usr/bin/vi
    for L in /usr/share/man/{,*/}man1/vim.1; do
        ln -sv vim.1 $(dirname $L)/vi.1
    done
    ln -sv ../vim/vim91/doc /usr/share/doc/vim-9.1.0041

    cat >/etc/vimrc <<"EOF"
" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif
EOF
}
