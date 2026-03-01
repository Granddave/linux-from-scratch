#!/bin/bash

set -ex

echo "Step 9.7: Configuring the System Locale"

cat >/etc/locale.conf <<"EOF"
LANG=en_US.UTF-8
EOF

cat >/etc/profile <<"EOF"
for i in $(locale); do
  unset ${i%=*}
done

if [[ "$TERM" = linux ]]; then
  export LANG=C.UTF-8
else
  source /etc/locale.conf

  for i in $(locale); do
    key=${i%=*}
    if [[ -v $key ]]; then
      export $key
    fi
  done
fi
EOF
