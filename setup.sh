#! /usr/bin/bash

if [[ -z "$INSTALL_INSTRUCTION" ]]; then
    echo "Please provide INSTALL_INSTRUCTION"
    exit 1
fi

mkdir -p "$HOME/.local"
export LOCAL_INSTALL_PATH="$HOME/.local"

# build deps
$INSTALL_INSTRUCTION build-essential cmake gettext unzip || exit 1

# zsh
$INSTALL_INSTRUCTION zsh
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# useful tools
cargo install zoxide
$INSTALL_INSTRUCTION tldr

./neovim.sh

# setup configs
$INSTALL_INSTRUCTION stow || exit 1
stow --adopt --target $HOME home

REPO_CHANGES=`git status --porcelain`
if [[ $REPO_CHANGES ]]; then
    echo "Changed files:"
    echo "$REPO_CHANGES"
    while true; do
        read -p "Replace dotfiles? [yN]" yn
        case $yn in
            [Yy]* ) git reset --hard; break;;
            * ) echo "You can replace them with 'git reset --hard'"; break;;
        esac
    done
fi

# initialize nvim and "fix" nvim-treesitter issues
$HOME/.local/bin/nvim
rm $LOCAL_INSTALL_PATH/lib/nvim/parser/lua.so
rm $LOCAL_INSTALL_PATH/lib/nvim/parser/vimdoc.so
