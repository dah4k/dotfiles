#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

##  [ ] Sudoer
        # COMMENT-OUT LINE "Defaults targetpw"
        # COMMENT-OUT LINE "ALL ALL=(ALL) ALL"
        # ADD LINE "%wheel ALL=(ALL) /usr/bin/zypper, /usr/bin/rpm, /sbin/shutdown, /usr/bin/systemctl, /usr/bin/nmtui, /usr/bin/nmcli, /usr/bin/mount -o ro /dev/sda1 /mnt/usbdisk, /usr/bin/umount /mnt/usbdisk"
##  [ ] NTP Configuration
        # Start NTP Daemon: Now and on Boot
        # Synchronization Servers: time.nrc.ca
        # Synchronization Servers: time.chu.nrc.ca
##  [ ] Network Settings (DNS)
        # Static Hostname: darkstar
        # Set Hostname vis DHCP: no
        # Custom Policy Rule: STATIC (no FALLBACK)
        # Name Server 1: 149.112.121.10     # private.canadianshield.cira.ca
        # Name Server 2: 149.112.122.10     # private.canadianshield.cira.ca

##  [x] Audio
##      [x] Disable pulseaudio
##      [x] Install pipewire
sudo zypper remove --clean-deps pulseaudio
sudo zypper addlock pulseaudio pavucontrol

##  [x] GNOME
##      [x] dconf
##      [x] gvfs
##      [x] gvfs iPod/iPhone backend
##      [x] drkonqi5
sudo zypper remove --clean-deps dconf gvfs gvfs-backend-afc drkonqi5
sudo zypper addlock dconf gvfs gvfs-backend-afc drkonqi5

##  [ ] Packman repositories
##      Key Fingerprint:  F8875B88 0D518B6B 8C530D13 45A1D067 1ABD1AFB
#sudo zypper addrepo --check --refresh --priority 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials
#sudo zypper addrepo --check --refresh --priority 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Multimedia/' packman-multimedia
#sudo zypper addrepo --check --refresh --priority 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Extra/' packman-extra

##  [ ] VLC repository (and vendor change)
##      Key Fingerprint: BC8D780D E3308581 B2E07085 33DE8FB7 C8DA93D2
#sudo zypper addrepo --refresh 'https://download.videolan.org/SuSE/Tumbleweed/' VLC
#sudo zypper install --no-recommends vlc vlc-codecs libdvdcss2

##  [x] Un-install LANG packages
rpm -qa | grep -- "-lang" | xargs sudo rpm -e

##  [x] Un-install unused packages
unused_packages="
    PackageKit
    PackageKit-gstreamer-plugin
    gnome-online-accounts
    libgnomesu
    libroffice
    mutter
    nano
    postfix
    screen
"
sudo zypper rm --clean-deps ${unused_packages}
sudo zypper addlock nano

##  [x] Install LightDM before removing GNOME Display Manager
sudo zypper install --no-recommends lightdm
sudo zypper rm --clean-deps gdm

##  [x] Install Development Tools
devtools="
    chromium
    dmenu
    evince
    evince-plugin-pdfdocument
    fd
    ghc
    ghc-xmonad
    ghc-xmonad-contrib
    ghc-xmonad-contrib-devel
    ghc-xmonad-devel
    git
    google-inconsolata-fonts
    htop
    memtest86+
    patch
    qiv
    ripgrep
    tmux
    twm
    xlsfonts
    xmonad
"
sudo zypper install --no-recommends ${devtools}
