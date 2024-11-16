#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

#  0,0      1080,0                      3680,0
#   +-----------+---------------------------+
#   |           |                           |
#   |   DP-2    |         DP-1              |
#   |           |                           |
#   | --rotate  |       --primary           |
#   | left(sic) |                           |
#   |           |                           |
#   |           +---------------------------+
#   |           |1080,1440              3680,1440
#   |           |
#   |           |
#   +-----------+
#  0,1920   1080,1920

xrandr \
    --output DP-1 --primary --mode 2560x1440 --rate 144 \
    --output DP-2 --mode 1920x1080 --rate 75 --rotate left --left-of DP-1

