#! /usr/bin/bash

./zsh.sh || exit 1
./rust.sh || exit 1
./uv_python.sh || exit 1
./neovim_config.sh || exit 1
./configs.sh || exit 1
