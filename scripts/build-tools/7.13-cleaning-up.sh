#!/bin/bash

step_no=7.13

build_phase() {
    rm -rf /usr/share/{info,man,doc}/*
    find /usr/{lib,libexec} -name \*.la -delete
}
