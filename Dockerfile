FROM debian:12

LABEL description="Environment for building a Linux From Scratch system"
LABEL version="12.1"
LABEL maintainer="davidisaksson93@gmail.com"

ENV LFS_VERSION=12.1-systemd
ENV LFS=/mnt/lfs

ENV LC_ALL=POSIX

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    binutils \
    bison \
    build-essential \
    gawk \
    python3 \
    sudo \
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

RUN groupadd lfs \
    && useradd -s /bin/bash -g lfs -m -k /dev/null lfs \
    && echo "lfs:lfs" | chpasswd
RUN echo "lfs ALL=NOPASSWD: ALL" >> /etc/sudoers.d/lfs
RUN echo 'Defaults env_keep += "LFS LC_ALL LFS_TGT PATH MAKEFLAGS"' >> /etc/sudoers.d/lfs

COPY ./scripts $LFS/scripts
COPY ./toolchain/* $LFS/sources

RUN chown -v lfs $LFS/sources

USER lfs
COPY ["lfs-user/.bash_profile", "lfs-user/.bashrc", "/home/lfs/" ]
RUN source ~/.bash_profile
