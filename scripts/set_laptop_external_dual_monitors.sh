#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

# See Also https://thelinuxcode.com/xrandr-linux-commands/

#   0,0     1080,0                      3680,0                      6200,0
#   +-----------+---------------------------+---------------------------+
#   |           |                           |                           |
#   |  DP-1-1   |       DP-1-3 (DP)         |       eDP-1 (Laptop)      |
#   |  (HDMI)   |       --primary           |                           |
#   |           |                           |                           |
#   | --rotate  |                           |                           |
#   | left(sic) |                           |                           |
#   |           +---------------------------+                           |
#   | Preset    |1080,1440         3680,1440|                           |
#   | "RTS"     |                           +---------------------------+
#   |           |                       3680,1600                   6200,1600
#   +-----------+
#   0,1920  1080,1921

xrandr \
    --output DP-1-1 --rotate left --pos 0x0 --mode 1920x1080 --rate 60 \
    --output DP-1-3 --primary --pos 1080x0 --mode 2560x1440 --rate 75 \
    --output eDP-1 --pos 3680x0 --mode 2560x1600 --rate 120
