#!/usr/bash

# Update #
yes | sudo pacman -Syyu

# Standard Items #

# Chromium #
yes | sudo pacman -S Chromium

# Gnome Extension #
yes | sudo pacman -S chrome-gnome-extension

# Dev Items #

# Git #
yes | sudo pacman -S Git

# Tilda Terminal #
yes | sudo pacman -S tilda

# Remmina #
yes | sudo pacman -S remmina

# Graphics #
# AMD #
yes | sudo pacman -S mesa

# Add Personal keyboard shortcut #

# KVM/Qemu #
yes | sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
# Setup Service #
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service