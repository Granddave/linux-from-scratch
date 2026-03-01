#!/bin/bash

set -ex

echo "Step 9.6: Configuring the Linux Console"

cat > /etc/vconsole.conf << "EOF"
KEYMAP=sv-latin1
FONT=Lat2-Terminus16
EOF
