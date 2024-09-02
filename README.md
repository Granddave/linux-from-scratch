# Linux From Scratch

This is a Docker powered build of [Linux From Scratch version 12.3 with Systemd](https://www.linuxfromscratch.org/lfs/view/12.1-systemd/index.html).

## Requirements

- Docker

## Build instructions

```sh
# On host
make

# In container
sh ../scripts/run.sh
```

## Thanks to

- Linux From Scratch community for the excellent book
- [@reinterpretcat](https://github.com/reinterpretcat/lfs) for their docker base where I got some inspiration.
