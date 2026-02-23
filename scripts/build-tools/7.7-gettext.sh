# The Gettext package contains utilities for internationalization and
# localization. These allow programs to be compiled with NLS (Native Language
# Support), enabling them to output messages in the user's native language.

step_no=7.7
pkg_name=gettext
pkg_tar=gettext-0.22.4.tar.xz

build_phase() {
    ./configure --disable-shared
    make
    cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
}
