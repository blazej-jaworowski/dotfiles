#! /usr/bin/bash

if [[ -z "$INSTALL_INSTRUCTION" ]]; then
    echo "Please provide INSTALL_INSTRUCTION"
    exit 1
fi

$INSTALLL_INSTRUCTION zsh
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
