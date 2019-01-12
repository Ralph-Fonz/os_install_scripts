#!/bin/bash

# Install Script For Ubuntu 18.04


#### Installing Basic stuff first ####

# Papirus Icon Theme #
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus \
sudo apt-get update
sudo apt-get install -y papirus-icon-theme

# Arc Gtk Theme #
# https://github.com/horst3180/arc-theme
sudo apt install -y arc-theme

# Gnome Tweak tool #
sudo apt install gnome-tweak-tool

# Gnome Shell Extentions #
sudo apt install gnome-shell-extensions

# Chromium #
sudo apt install -y chromium-browser

# Chrome #
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Spotify #
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
sudo apt install -y spotify-client

##@# Install Dev Stuff ###@

# Git #
sudo apt install -y git

# x-clip #
sudo apt install -y xclip

# VSCode #
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

# Docker #
sudo apt install -y docker

# Vim #
sudo apt install -y vim

# my Key commands
# ssh-keygen
# xclip -sel c < .ssh/id_rsa.pub 