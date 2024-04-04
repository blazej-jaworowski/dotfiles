#! /usr/bin/bash

stow --adopt --target $HOME home || exit 1
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
