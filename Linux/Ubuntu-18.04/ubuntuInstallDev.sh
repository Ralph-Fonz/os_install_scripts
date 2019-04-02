#!/bin/bash

# Install Script For Ubuntu 18.04
## Install List
# xclip, wget, vim, g-tweak-tool, arc-theme, papirus, gnome-Extensions, virt-manager,
# chromium, chrome, vscode, git, notepad++ || notepadqq, docker, tilda, zsh, oh-my-zsh,
# nvidia drivers, steam


######################## Pre-REQ #############################
sudo apt update
sudo apt upgrade -y

# x-clip #
sudo apt install -y xclip

# snap #
sudo apt install -y snap

# wget#
sudo apt install -y gdebi-core wget

# Vim #
sudo apt install -y vim

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

# Dotnet Core v2.2 #
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.2

# Git #
sudo apt install -y git

# Notepad++ #
snap install -y notepad-plus-plus

# notepadqq #
#sudo snap install -y notepadqq

# Docker #
sudo apt install -y docker.io

# Tilda #
sudo apt install -y tilda

###################### zsh & oh-my-zsh ##########################

# zsh #
sudo apt install -y zsh

# oh-my-zsh #
sudo apt install -y powerline fonts-powerline
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
##### Instructions after install ###
# oh-my-zsh doc: https://github.com/robbyrussell/oh-my-zsh
# vi ~/.zshrc
# set ZSH_THEME="agnoster"


###################### Nvidia / AMD Driver ######################


 sudo add-apt-repository ppa:graphics-drivers/ppa \
 sudo apt update
 sudo ubuntu-drivers autoinstall
 echo 'Current NVIDIA ONLY Installed'

########################### Steam ###############################

sudo add-apt-repository multiverse
sudo apt install -y steam

#################### Kernel UI Installer ########################

sudo add-apt-repository ppa:teejee2008/ppa 
sudo apt-get install -y ukuu

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

### things to remember 
# ssh-keygen
# xclip -sel c < .ssh/id_rsa.pub 
