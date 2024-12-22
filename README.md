# Linux From Scratch

This is a Docker powered build of [Linux From Scratch version 12.3 with Systemd](https://www.linuxfromscratch.org/lfs/view/12.1-systemd/index.html).

## Requirements

- Docker

## Build instructions

```sh
# On host
make

# In container
sh ../scripts/packages/fetch.sh  # Download sources
sh ../scripts/version-check.sh   # Verify tools on host is OK
sh ../scripts/run.sh             # Build tools for building the OS
```

## Thanks to

- Linux From Scratch community for the excellent book
- [@reinterpretcat](https://github.com/reinterpretcat/lfs) for their docker base where I got some inspiration.
