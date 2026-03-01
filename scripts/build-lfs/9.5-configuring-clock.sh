#!/bin/bash

set -ex

echo "Step 9.5: Configuring the clock"

# hardware clock is set to local time
cat >/etc/adjtime <<"EOF"
0.0 0 0.0
0
LOCAL
EOF
