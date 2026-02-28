#!/bin/bash

# Ninja is a small build system with a focus on speed.

step_no=8.55
pkg_name=ninja
pkg_version=1.11.1
pkg_tar=$pkg_name-$pkg_version.tar.gz

build_phase() {
    export NINJAJOBS=4

    sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

    python3 configure.py --bootstrap

    ./ninja ninja_test
    ./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

    install -vm755 ninja /usr/bin/
    install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
    install -vDm644 misc/zsh-completion /usr/share/zsh/site-functions/_ninja
}
