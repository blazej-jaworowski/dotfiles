#! /usr/bin/bash

git clone https://github.com/fsquillace/junest.git ~/.local/share/junest || exit 1

junest setup || exit 1

cp pacman_mirrorlist $HOME/.junest/etc/pacman.d/mirrorlist || exit 1

junest sudo pacman -Syu --noconfirm || exit 1
junest sudo pacman -Sy --noconfirm - < packages || exit 1

export PATH="$PATH:$HOME/.junest/usr/bin_wrappers"

./setup.sh || exit 1
