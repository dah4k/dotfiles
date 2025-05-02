#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

printer="
    cups
    OpenPrintingPPDs-ghostscript
"
sudo zypper install --no-recommends ${printer}
