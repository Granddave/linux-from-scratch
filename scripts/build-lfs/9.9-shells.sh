#!/bin/bash

set -ex

echo "Step 9.9: Creating the /etc/shells File"

cat >/etc/shells <<"EOF"
/bin/sh
/bin/bash
EOF
