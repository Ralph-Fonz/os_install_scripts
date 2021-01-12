#!/usr/bin/bash

### Developer: Ralph_Fonz
### Date published: Thurs Nov 12
### Description: Personal Install Script for after fresh install


## ========== +++++ [[ Variables ]] ++++ ============ ##
read -r -p 'Password: ' pass

## ========== +++++ [[ Functions ]] ++++ ============ ##

downloadPacman() {
		for i in "$1"; do
			printf 'Installing ' "$i"
			yes | sudo pacman -S "$i"
		done
		printf '\n'
}

downloadAur() {
for i in "$i"; do
	printf 'Installing ' "$i"
	echo -ne $pass | pamac build "$i" --no-confirm
	printf '\n'
done
}


# PASSWORD PROMPT
# read -s -p 'Enter Password: ' mypass



## ========== +++++ [[ Updating ]] ++++ ============ ##
echo 'Updating'
echo -ne $pass | sudo pacman -Syu
printf '\n'

## ========== +++++ [[ Generic Programs Needed ]] ++++ ============ ##
declare -a programs=(
	"Chromium"
	"chrome-gnome-extension"
	"tilda"
	"remmina"
	"powerline-fonts"
)

for i in "${programs[@]}"; do
	echo 'Installing ' "$i"
	yes | sudo pacman -S "$i"
	printf '\n'
done

# Oh my zsh
# https://ohmyz.sh/
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Dont forget to change your theme!'
printf '\n'

## ========== +++++ [[ AUR Programs ]] ++++ ============ ##
declare -a pamac=(
	"slack-desktop"
	"spotify-legacy"
	"android-messages-desktop"
	"google-chrome"
)

downloadAur "$pamac"

## ========== +++++ [[ VPN | Private Internet Access ]] ++++ ============ ##

read -p "Do you own Private Internet Access?" choice
case $choice in
 y|Y ) 
echo 'Downloading Private Internet Access VPN'
wget 'https://installers.privateinternetaccess.com/download/pia-linux-2.5.1-05676.run'
sh pia-linux-*.run
printf '\n'
 ;;
 n|N ) echo "no";;
 *) echo "invalid";;
 esac

## ========== +++++ [[ Developer Programs ]] ++++ ============ ##

declare -a developerPacman=(
	"docker"
	"code"
	"Git"
)

declare -a developerAUR=(
	"amazon-workspaces-bin"
	"insomnia-bin"
	"postman-bin"
)

read -p "Are you a Developer?" choice
case $choice in
 y|Y ) 
## Install Pacmac DevTools
 downloadPacman "$developerPacman"
 ## Install AUR Dev Tools
downloadAur "$developerAUR"
 ;;
 n|N ) 
 break
 ;;
 *) echo "invalid";;
 esac


## ========== +++++ [[ Virtualization Programs ]] ++++ ============ ##

declare -a virtualization=(
	"virtual-manager"
	"virt-viewer"
	"qemu"
	"vde2"
	"ebtables"
	"dnsmasq"
	"bridge-utils"
	"openbsd-netcat"
)


read -p "Will this be used for VMs?" choice
case $choice in
 y|Y )
downloadPacman "$virtualization"

# KVM/Qemu #
# Setup Service #
sudo systemctl enable libvirtd.servizce
sudo systemctl start libvirtd.service
 ;;
 n|N ) 
 break;;
 *) echo "invalid";;
 esac

## ========== +++++ [[ GPU INSTALL ]] ++++ ============ ##

# AMD
read -p "AMD gpu installed?" choice
case $choice in
 y|Y ) 
yes | sudo pacman -S mesa
printf '\n'
 ;;
 n|N )
 break;;
 *) echo "invalid";;
 esac

# NVIDIA
read -p "AMD gpu installed?" choice
case $choice in
 y|Y ) 
echo "Nothing created yet"
printf '\n'
 ;;
 n|N )
 break;;
 *) echo "invalid";;
 esac


## ========== +++++ [[ REBOOT ]] ++++ ============ ##
echo "Installation complete, RESTART REQUIRED"
printf "\n"

read -p "Restart now?" choice
case $choice in
 y|Y ) 
sudo reboot
 ;;
 n|N )
 break;;
 *) echo "invalid";;
 esac

