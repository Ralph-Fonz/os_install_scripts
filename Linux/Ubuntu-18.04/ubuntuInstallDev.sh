#!/bin/bash

# Install Script For Ubuntu 18.04


################# FOR CUSTOMIZING GNOME ######################

# Papirus Icon Theme #
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus \
sudo apt-get update
sudo apt-get install -y papirus-icon-theme

# Arc Gtk Theme #
# https://github.com/horst3180/arc-theme
sudo apt install -y arc-theme

# Gnome Tweak tool #
sudo apt install -y gnome-tweak-tool

# Gnome Shell Extentions #
sudo apt install -y gnome-shell-extensions

################### VirtManager (KVM) ########################

# Checks if yoru cpu can use hypervisor & returns only 1 'svm'
isHyper=$(grep -o -m 1 'vmx\|svm' /proc/cpuinfo | head -1)

if [ $isHyper = 'svm' ]; then
  sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager
  # Add user to KVM Groups
  sudo adduser $USER libvirt
  sudo adduser $USER libvirt-quemu
  echo '###########################'
  echo 'Installation of virt-manager complete!'
  echo '###########################'
else
  echo '###########################'
  echo 'Cannot install virt-manager'
  echo '###########################'
fi

#################### Typical Browers #########################

# Chromium #
sudo apt install -y chromium-browser

# Chrome #
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


####################### Dev Tools ############################

# VSCode #
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

# Git #
sudo apt install -y git

# Notepad++ #
snap install notepad-plus-plus

# x-clip #
sudo apt install -y xclip

# snap #
sudo apt install -y snap

# notepadqq #
sudo snap install notepadqq

# Docker #
sudo apt install -y docker

# Vim #
sudo apt install -y vim

# Tilda #
sudo apt install -y tilda

#################### Complete Statement #########################

echo 'Installation complete, please restart your system'

### things to remember 
# ssh-keygen
# xclip -sel c < .ssh/id_rsa.pub 