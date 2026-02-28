#!/bin/bash

# The GCC package contains the GNU compiler collection, which includes the C
# and C++ compilers.

step_no=8.28
pkg_name=gcc
pkg_version=13.2.0
pkg_tar=$pkg_name-$pkg_version.tar.xz

patch_phase() {
    case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64
        ;;
    esac
}

build_phase() {
    mkdir -v build
    cd build

    ../configure \
        --prefix=/usr \
        LD=ld \
        --enable-languages=c,c++ \
        --enable-default-pie \
        --enable-default-ssp \
        --disable-multilib \
        --disable-bootstrap \
        --disable-fixincludes \
        --with-system-zlib

    make

    ulimit -s 32768

    # # Create the tester user if it doesn't exist
    # if ! getent group tester >/dev/null; then
    #     groupadd -g 101 tester
    # fi
    # if ! getent passwd tester >/dev/null; then
    #     useradd -c 'Tester' -d /home/tester -m -k /dev/null -s /bin/bash -u 101 -g 101 tester
    # fi
    #
    # chown -R tester .
    # NPROC=10 # Change depending on system
    # su tester -c "PATH=$PATH make -k check -j$NPROC" || true
    # ../contrib/test_summary
    #
    # # Stop here for inspection
    # echo "===SHELL==="
    # bash

    make install

    chown -v -R root:root \
        /usr/lib/gcc/$(gcc -dumpmachine)/13.2.0/include{,-fixed}
    ln -svr /usr/bin/cpp /usr/lib
    ln -sv gcc.1 /usr/share/man/man1/cc.1

    ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/13.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

    # Make sure we can compile
    echo 'int main(){}' >dummy.c
    cc dummy.c -v -Wl,--verbose &>dummy.log
    readelf -l a.out | grep ': /lib'

    SUCCESSES=$(grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log)
    if [ "$(echo "$SUCCESSES" | wc -l)" -ne 3 ]; then
        echo "Expected 3 crt*.o succeeded lines, but got:"
        echo "$SUCCESSES"
        exit 1
    fi

    grep -B4 '^ /usr/include' dummy.log

    grep 'SEARCH.*/usr/lib' dummy.log | sed 's|; |\n|g'
    # Expected output:
    # SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
    # SEARCH_DIR("/usr/local/lib64")
    # SEARCH_DIR("/lib64")
    # SEARCH_DIR("/usr/lib64")
    # SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")
    # SEARCH_DIR("/usr/local/lib")
    # SEARCH_DIR("/lib")
    # SEARCH_DIR("/usr/lib");

    grep "/lib.*/libc.so.6 " dummy.log
    grep found dummy.log
    rm -v dummy.c a.out dummy.log
    mkdir -pv /usr/share/gdb/auto-load/usr/lib
    mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
}
