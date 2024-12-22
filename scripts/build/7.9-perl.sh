#!/bin/bash
set -euo pipefail
set -x

# The Perl package contains the Practical Extraction and Report Language.

echo "Step 7.9: Build Perl"

tar -xf /sources/perl-5.38.2.tar.xz -C /tmp/
mv /tmp/perl-* /tmp/perl

pushd /tmp/perl

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

popd # /tmp/perl
