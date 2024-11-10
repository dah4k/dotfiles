# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

HASHICORP_REPO_URL="https://rpm.releases.hashicorp.com/RHEL/9/\$basearch/stable"
HASHICORP_REPO_NAME="Hashicorp Stable - RHEL 9 - \$basearch"
HASHICORP_REPO_ALIAS="hashicorp"
HASHICORP_RPM_GPG="https://rpm.releases.hashicorp.com/gpg"

sudo zypper addrepo --refresh --gpgcheck --name "$HASHICORP_REPO_NAME" $HASHICORP_REPO_URL $HASHICORP_REPO_ALIAS
sudo rpm --import $HASHICORP_RPM_GPG
sudo zypper install --no-recommends vagrant
