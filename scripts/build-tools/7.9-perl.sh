# The Perl package contains the Practical Extraction and Report Language.

step_no=7.9
pkg_name=perl
pkg_tar=perl-5.38.2.tar.xz

build_phase() {
    sh Configure \
        -des                                        \
        -Dprefix=/usr                               \
        -Dvendorprefix=/usr                         \
        -Duseshrplib                                \
        -Dprivlib=/usr/lib/perl5/5.38/core_perl     \
        -Darchlib=/usr/lib/perl5/5.38/core_perl     \
        -Dsitelib=/usr/lib/perl5/5.38/site_perl     \
        -Dsitearch=/usr/lib/perl5/5.38/site_perl    \
        -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
        -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl
    make
    make install
}
