#!/bin/bash

step_no=7.13
pkg_name=""
pkg_tar=""

build_phase() {
    rm -rf /usr/share/{info,man,doc}/*
    find /usr/{lib,libexec} -name \*.la -delete
}
