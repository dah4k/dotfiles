#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

## Stop tracker-miner-fs file indexing $HOME, esp. during compilation
sudo apt-get autoremove tracker-miner-fs

evolution_packages="
    evolution-data-server
    evolution-data-server-common
    evolution-source-registry
    evolution-calendar-factory
    evolution-addressbook-factory
"
## https://askubuntu.com/questions/315640/how-do-i-completely-remove-evolution
sudo apt-get --purge remove ${evolution_packages}
