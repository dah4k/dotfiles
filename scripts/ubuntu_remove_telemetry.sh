#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

## Originally based from [ubuntu-remove-telemetry.sh](https://gist.github.com/CodeSigils/974abb61becf435c857b55e925f12780) by CodeSigils (2022)

echo "[*] Resolving Ubuntu telemetry servers to localhost"
sudo cat<<EOF | sudo tee --append /etc/hosts

## Resolving Ubuntu telemetry servers to localhost
127.0.0.1	www.metrics.ubuntu.com
127.0.0.1	metrics.ubuntu.com
127.0.0.1	www.popcon.ubuntu.com
127.0.0.1	popcon.ubuntu.com
EOF

echo "[*] Decline telemetry"
sudo ubuntu-report -f send no

telemetry_services="
    apport
    apport-symptoms
    popularity-contest
    ubuntu-report
    whoopsie
"
echo "[*] Removing telemetry services"
sudo apt purge -y ${telemetry_services}
sudo apt-mark hold ${telemetry_services}
