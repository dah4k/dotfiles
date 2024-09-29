#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

devtools="
    afl++
    clang
    dmenu
    docker.io
    exuberant-ctags
    fd-find
    fonts-inconsolata
    g++
    gcc
    gdb
    ghc
    git
    libghc-xmonad-contrib-dev
    libghc-xmonad-dev
    libxcb-ewmh-dev
    memtest86++
    ncal
    ripgrep
    socat
    tmux
    valgrind
    w3m
    xmonad
"

sudo apt-get install --no-install-recommends ${devtools}
