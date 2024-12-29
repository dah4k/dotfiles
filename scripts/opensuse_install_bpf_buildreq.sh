#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: Apache-2.0

# https://docs.cilium.io/en/latest/reference-guides/bpf/toolchain/#development-environment
bpf_buildreq="
    bc
    bison
    clang
    flex
    gcc
    git
    glibc-devel-static
    graphviz
    libcap-devel
    libelf-devel
    libopenssl-devel
    llvm
    ncurses-devel
"
sudo zypper install --no-recommends ${bpf_buildreq}
