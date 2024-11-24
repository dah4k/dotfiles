#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

#  0,0      1080,0
#   +-----------+
#   |           |1080,164               3680,164
#   |           +---------------------------+
#   |           |                           |
#   |   DP-2    |         DP-1              |
#   |           |                           |
#   | --rotate  |       --primary           |
#   | left(sic) |                           |
#   |           |                           |
#   |           +---------------------------+
#   |           |1080,1604              3680,1604
#   |           |
#   +-----------+
#  0,1920   1080,1920

xrandr \
    --output DP-1 --primary --mode 2560x1440 --pos 1080x164 --rate 144 \
    --output DP-2 --mode 1920x1080 --pos 0x0 --rate 75 --rotate left

