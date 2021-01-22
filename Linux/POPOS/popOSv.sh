#!/bin/bash

# Updated [Thursday May 9th 2019] for version >>> 

declare -a apt=(
    "xclip", "Snap", "gdebi-core wget", "vim", "chromium-browser", ""
)

######################## Pre-REQ #############################
sudo apt update
sudo apt upgrade -y
echo 'Update and Upgrade complete'

# Create install folder
cd ~/ \
mkdir installs \
cd installs \
echo 'Created installer folder'




#################### Typical Browers #########################

# Chromium #
sudo apt install -y chromium-browser
echo 'Chromium Installed'

# Chrome #
cd ~/installs \
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo 'Chrome-brower Installed'

cd ~/installs \
wget https://installers.privateinternetaccess.com/download/pia-linux-1.1.1-02545.run \
sh pia-linux-1.1.1-02545.run \
echo 'Private Internet Access Installed'

####################### Dev Tools ############################

# VSCode #
sudo apt install -y software-properties-common apt-transport-https wget
cd ~/installs \
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code
echo 'VSCode Installed'

# Dotnet Core v2.2 #
cd ~/installs \
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe \
echo 'Universe Repo Added'
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.2
echo 'DotNet Core 2.2 Installed'

# Git #
sudo apt install -y git
echo 'Git Installed'

# Notepad++ #
sudo snap install notepad-plus-plus
echo 'Notepad++ Installed'

# notepadqq #
#sudo snap install -y notepadqq

# Docker #
sudo apt install -y docker.io
echo 'Docker CLI Installed'

# Tilda #
sudo apt install -y tilda
echo 'Andriod Tilda Terminal Installed'

######################  Design Editors ###########################

# Gimp #
sudo snap install gimp
echo 'Gimp Installed'

####################### Communication ############################

# Android Messaging #
# Doc Reference
# https://github.com/chrisknepper/android-messages-desktop
cd ~/installs \
wget https://github.com/chrisknepper/android-messages-desktop/releases/download/v1.0.0/android-messages-desktop_1.0.0_amd64.deb \
sudo dpkg -i android-messages-desktop_1.0.0_amd64.deb
echo 'Andriod Messaging Installed'

# Discord #
sudo snap install discord
echo 'Discord Installed'

# Slack #
sudo snap install slack --classic
echo 'Slack Installed'


###################### zsh & oh-my-zsh ##########################

# zsh #
sudo apt install -y zsh
echo 'ZSH Installed'

# oh-my-zsh #
sudo apt install -y powerline fonts-powerline
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo 'Oh-My-Zsh Installed'
##### Instructions after install ###
# oh-my-zsh doc: https://github.com/robbyrussell/oh-my-zsh
# vi ~/.zshrc
# set ZSH_THEME="agnoster"


########################### Steam ###############################

sudo add-apt-repository multiverse
echo 'Multiverse added'
sudo apt install -y steam
echo 'Steam Installed'

#################### Kernel UI Installer ########################

#sudo add-apt-repository ppa:teejee2008/ppa 
#sudo apt-get install -y ukuu
#echo 'Kernel Updater Installed'

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
echo 'Created repo folders'

# Clone os_install #
cd ~/repos \
git clone https://github.com/CtrlNull/os_install_scripts.git \
echo 'Created copy of os install in ~/repos'

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
