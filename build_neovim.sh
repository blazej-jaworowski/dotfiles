#! /usr/bin/bash

# If your distribution has outdated neovim, you can build
# neovim from source

if [[ -z "$LOCAL_INSTALL_PATH" ]]; then
    echo "Please provide LOCAL_INSTALL_PATH"
    exit 1
fi

git clone -b "v0.9.5" --depth 1 https://github.com/neovim/neovim.git $HOME/neovim || exit 1
cd $HOME/neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$LOCAL_INSTALL_PATH -j || exit 1
make install || exit 1
