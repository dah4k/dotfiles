# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

export LANG=C.UTF-8
export PATH=$HOME/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LC_TIME="en_US.UTF-8"

## NOTE: Do not enable both ``-S`` and ``-F``. Choose only one or none.
export LESS="-MiRF"
export LESSHISTFILE="/dev/null"

## Force to use TTY (ie. never use X11 ssh-askpass)
export SSH_ASKPASS=
export SSH_ASKPASS_REQUIRE=never

## Fix locale date/time format
export LC_TIME="en_US.UTF-8"

## Fix XDG user environment variables missing on XMonad desktop
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

## NOTE: JH directory must end with slash ('/')
## https://www.gog.com/forum/jupiter_hell/game_save_directory_on_linux
export JH_PREF_PATH=$HOME/.config/jupiterhell/

## Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
if [ -d "$HOME/.dotnet/tools" ]; then
    export PATH=$HOME/.dotnet/tools:$PATH
fi
