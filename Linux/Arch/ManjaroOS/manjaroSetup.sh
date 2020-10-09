#!/usr/bash

declare -a arr=(
"code" "Chromium" "chrome-gnome-extension", "Git", "tilda", "tilda", "remmina", "mesa"
"virtual-manager", "qemu", "vde2", "ebtables", "dnsmasq", "bridge-utils", "openbsd-netcat"
)

# PASSWORD PROMPT
read -s -p "Enter Password: " mypassword

# Update #
yes | sudo pacman -Syyu

# Loop over array above and install programs from pacman
for i in "${arr[@]}"
do
	yes | sudo pacman -S "$i"
done 

#AUR
#Amazon Workspace

declare -a pamac=("amazon-workspaces-bin","slack-desktop","spotify-legacy")

for m in "${pamac[@]}"
do
	pamac build "$m"
done

# Add Personal keyboard shortcut #

# KVM/Qemu #
# Setup Service #
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
