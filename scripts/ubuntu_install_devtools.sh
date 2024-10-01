#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

devtools="
    afl++
    asciidoctor
    clang
    cmake
    dmenu
    docker.io
    exuberant-ctags
    fd-find
    ffmpeg
    fonts-inconsolata
    g++
    gcc
    gdb
    ghc
    git
    libghc-xmonad-contrib-dev
    libghc-xmonad-dev
    libxcb-ewmh-dev
    make
    memtest86++
    ncal
    ninja-build
    patch
    plocate
    ripgrep
    ruby-asciidoctor-pdf
    socat
    tmux
    valgrind
    vlc
    w3m
    xmonad
"

sudo apt-get install --no-install-recommends ${devtools}
