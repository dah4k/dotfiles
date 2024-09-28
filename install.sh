#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

install() {
    . ./dotfiles.shlib

    for x in $dotfiles; do
        ## Make sure parent directory exist
        parent=$HOME/.$(dirname $x)
        [ -d $parent ] || mkdir -p $parent

        ln -sfT $PWD/$x $HOME/.$x
    done
}

install
