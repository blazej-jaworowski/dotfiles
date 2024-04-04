#! /usr/bin/bash

mkdir -p "$HOME/.config" || exit 1
git clone https://github.com/blazej-jaworowski/nvim-distro.git $HOME/.config/nvim || exit 1
