#! /usr/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/Hack.zip || exit 1
unzip Hack.zip -d HackNerdFont || exit 1
rm Hack.zip

mkdir -p $HOME/.fonts || exit 1
mv HackNerdFont $HOME/.fonts || exit 1
