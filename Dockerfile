FROM debian:12

LABEL description="Environment for building a Linux From Scratch system"
LABEL version="12.1"
LABEL maintainer="davidisaksson93@gmail.com"

ENV LFS_VERSION=12.1-systemd
ENV LFS=/mnt/lfs

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    binutils \
    bison \
    build-essential \
    gawk \
    python3 \
    texinfo \
    vim \
    wget \
    && apt-get -q -y autoremove \
    && rm -rf /var/lib/apt/lists/*

# Set bash as default shell instead of dash
RUN update-alternatives --install /bin/sh sh /bin/bash 100

RUN mkdir -pv $LFS/sources
    # && chmod -v a+wt $LFS/sources

WORKDIR $LFS/sources

COPY ./scripts $LFS/scripts
COPY ./toolchain/* $LFS/sources
