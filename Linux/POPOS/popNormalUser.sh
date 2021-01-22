#!/bin/bash

# Updated [Thursday May 9th 2019] for version >>> 



######################## Pre-REQ #############################
sudo apt update
sudo apt upgrade -y
echo 'Update and Upgrade complete'

# Create install folder
cd ~/ \
mkdir installs \
cd installs \
echo 'Created installer folder'

# x-clip #
# i use this as a terminal clipboard tool'
sudo apt install -y xclip
echo 'XClip Installed'

# snap #
sudo apt install -y snap
echo 'Snap Installed'

# wget#
sudo apt install -y gdebi-core wget
echo 'wget Installed'

# Vim #
sudo apt install -y vim
echo 'Vim Installed'

################# FOR CUSTOMIZING GNOME ######################

# Papirus Icon Theme #
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus \
sudo apt-get update
sudo apt-get install -y papirus-icon-theme
echo 'Papirus Installed'

# Arc Gtk Theme #
# https://github.com/horst3180/arc-theme
sudo apt install -y arc-theme
echo 'arc-theme Installed'

# Gnome Tweak tool #
sudo apt install -y gnome-tweak-tool
echo 'Gnome Tweak tool Installed'

# Gnome Shell Extentions #
sudo apt install -y gnome-shell-extensions
echo 'Gnome shell extentions installed'

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

####################### Snap Installs ###########################

snap install onlyoffice-desktopeditors

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
