#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

uninstall() {
    . ./dotfiles.shlib

    for x in $dotfiles; do
        rm $HOME/.$x
    done
}

uninstall
