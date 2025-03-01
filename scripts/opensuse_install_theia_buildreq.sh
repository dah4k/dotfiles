#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: EPL-2.0

# https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md#prerequisites
theia_buildreq="
    gcc
    gcc-c++
    libX11-devel
    libsecret-devel
    libxkbfile-devel
    make
    nodejs-default
    nodejs22
    npm-default
    npm22
    pkgconf-pkg-config
    python311
    typescript
    yarn
"
sudo zypper install --no-recommends ${theia_buildreq}
