#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

# See Also https://thelinuxcode.com/xrandr-linux-commands/

#  0,0                      2560,0                      5120,0
#   +---------------------------+---------------------------+
#   |                           |                           |
#   |       DP-1-3 (DP)         |       eDP-1 (Laptop)      |
#   |       --primary           |       --right-of DP-1-3   |
#   |                           |                           |
#   |                           |                           |
#   |                           |                           |
#   +---------------------------+                           |
#   |0,1440            2560,1440|                           |
#                               +---------------------------+
#                           2560,1600                   5120,1600

xrandr \
    --output DP-1-3 --primary --pos 0x0 --mode 2560x1440 --rate 75 \
    --output eDP-1 --right-of DP-1-3 --mode 2560x1600 --rate 120
