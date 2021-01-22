#!/usr/bash

declare -a arr=(
"code" "Chromium" "chrome-gnome-extension", "Git", "tilda", "remmina", "mesa"
"virtual-manager", "qemu", "vde2", "ebtables", "dnsmasq", "bridge-utils", "openbsd-netcat", "steam",
"powerline-fonts", "zsh", "gimp", "docker.io", "notepadplusplus"
)

# things to check: Discord, slack, 

# PASSWORD PROMPT
read -s -p "Enter Password: " mypassword

# Update #
yes | sudo pacman -Syyu \

######################   Pacman Loop   ############################

for i in "${arr[@]}"
do
	yes | sudo pacman -S "$i" \
done 
######################    AUR Loop    #############################

declare -a pamac=("amazon-workspaces-bin","slack-desktop","spotify-legacy")

for m in "${pamac[@]}"
do
	pamac build "$m" \
	n \
	y \
	$mypassword \
done

# Add Personal keyboard shortcut #

########################   KVM/Qemu   ############################
# Setup Service #
sudo systemctl enable libvirtd.service \
sudo systemctl start libvirtd.service \


#################### Git and ssh-key setup #######################

# Setup Git global args #
read -p "Enter your git user.name" userName
git config --global user.name $userName \
read -p "Enter your git user.email" userEmail
git config --global user.email $userEmail \

# Setup SSH Key #
cd ~/ \
ssh-keygen \
echo 'Created SSH-Key'

# Create repos && workRepos Folder #
cd ~/ \
mkdir repos \
mkdir workRepos \
mkdir Installs \
echo 'Created repo and install folders'

#################### Complete Statement #########################

PS3='Installation complete, RESTART REQUIRED'
options=("Restart" "Power-Off" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Restart")
            sudo reboot
            ;;
        "Power-Off")
            sudo poweroff
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done