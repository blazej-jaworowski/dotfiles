#! /usr/bin/bash

if [[ -z "$INSTALL_INSTRUCTION" ]]; then
    echo "Please provide INSTALL_INSTRUCTION"
    exit 1
fi

mkdir -p "$HOME/.local"
export LOCAL_INSTALL_PATH="$HOME/.local"

# setup python
$INSTALL_INSTRUCTION python3 python3-pip python3-venv || exit 1

./neovim.sh

# initialize nvim and "fix" nvim-treesitter issues
echo "Wait for plugins to install, then exit" | nvim
rm $LOCAL_INSTALL_PATH/lib/parser/lua.so
rm $LOCAL_INSTALL_PATH/lib/parser/vimdoc.so
