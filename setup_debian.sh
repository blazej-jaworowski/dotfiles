#! /usr/bin/bash

sudo apt update || exit 1
sudo DEBIAN_FRONTEND=noninteractive apt install -y nala || exit 1
sudo DEBIAN_FRONTEND=noninteractive nala upgrade -y || exit 1
xargs sudo DEBIAN_FRONTEND=noninteractive nala install -y < packages || exit 1

./setup.sh || exit 1
