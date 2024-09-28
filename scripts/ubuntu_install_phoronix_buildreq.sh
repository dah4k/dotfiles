#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

phoronix_test_suite_buildreq="
    php-cli
    php-xml
"

sudo apt-get install --no-install-recommends ${phoronix_test_suite_buildreq}
