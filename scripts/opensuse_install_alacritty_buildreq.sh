#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

alacritty_buildreq="
cargo
cmake
fontconfig-devel
freetype2-devel
libxcb-devel
libxkbcommon-devel
rust
"
sudo zypper install --no-recommends ${alacritty_buildreq}
