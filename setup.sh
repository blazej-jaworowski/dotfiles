#! /usr/bin/bash

if [[ -z "$INSTALL_INSTRUCTION" ]]; then
    echo "Please provide INSTALL_INSTRUCTION"
    exit 1
fi

JOB_COUNT=7
LOCAL_INSTALL_PATH="$HOME/.local"

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local"

# setup python

$INSTALL_INSTRUCTION python3 python3-pip python3-venv || exit 1

# setup neovim

$INSTALL_INSTRUCTION build-essential cmake gettext unzip || exit 1

(
    git clone -b "v0.9.5" --depth 1 https://github.com/neovim/neovim.git &&
    cd neovim &&
    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$LOCAL_INSTALL_PATH -j $job &&
    make install
) || exit 1

# neovim plugin deps
$INSTALL_INSTRUCTION ripgrep mercurial wget || exit 1

git clone https://github.com/blazej-jaworowski/nvim-distro.git $HOME/.config/nvim
