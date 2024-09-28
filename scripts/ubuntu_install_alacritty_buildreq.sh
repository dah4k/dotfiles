#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

alacritty_buildreq="
    cargo
    cmake
    libfontconfig-dev
    libfreetype-dev
    libxkbcommon-dev
    rustc
"

sudo apt-get install --no-install-recommends ${alacritty_buildreq}
