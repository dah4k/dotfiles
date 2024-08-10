#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

# See Also https://learn.microsoft.com/en-us/dotnet/core/install/linux-sles
# sudo rpm -Uvh https://packages.microsoft.com/config/sles/15/packages-microsoft-prod.rpm
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo --check --refresh --gpgcheck-strict \
    'https://packages.microsoft.com/sles/15/prod/' packages-microsoft-com-prod
sudo zypper install dotnet-sdk-8.0
