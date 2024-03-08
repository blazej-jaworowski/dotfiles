#! /usr/bin/bash

if [[ -z "$INSTALL_INSTRUCTION" ]]; then
    echo "Please provide INSTALL_INSTRUCTION"
    exit 1
fi

if [[ -z "$LOCAL_INSTALL_PATH" ]]; then
    echo "Please provide LOCAL_INSTALL_PATH"
    exit 1
fi

echo "Setting up neovim"

# neovim build deps
$INSTALL_INSTRUCTION build-essential cmake gettext unzip || exit 1

# install neovim
git clone -b "v0.9.5" --depth 1 https://github.com/neovim/neovim.git $HOME/neovim || exit 1
cd $HOME/neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$LOCAL_INSTALL_PATH -j || exit 1
make install || exit 1

# neovim plugin deps
$INSTALL_INSTRUCTION ripgrep mercurial wget || exit 1

# install neovim config
mkdir -p "$HOME/.config"
git clone https://github.com/blazej-jaworowski/nvim-distro.git $HOME/.config/nvim
