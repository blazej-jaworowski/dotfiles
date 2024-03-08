#! /usr/bin/bash

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install nala -y
sudo DEBIAN_FRONTEND=noninteractive nala upgrade -y
sudo DEBIAN_FRONTEND=noninteractive nala install -y build-essential

INSTALL_INSTRUCTION="sudo DEBIAN_FRONTEND=noninteractive nala install -y" ./setup.sh
