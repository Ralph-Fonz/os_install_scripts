#!/usr/bin/bash

declare -a programs=(
	"code"
	"Chromium"
	"chrome-gnome-extension"
	"Git"
	"tilda"
	"tilda"
	"remmina"
	"powerline-fonts"
)

# PASSWORD PROMPT
# read -s -p 'Enter Password: ' mypass

printf '\n'
# Update #
echo 'Updating'
yes | sudo pacman -Syyu
$mypass
printf '\n'

# Loop over array above and install programs from pacman
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

echo 'Downloading Private Internet Access VPN'
wget 'https://installers.privateinternetaccess.com/download/pia-linux-2.5.1-05676.run'
sh pia-linux-*.run
printf '\n'

#AUR

declare -a pamac=(
	"amazon-workspaces-bin"
	"slack-desktop"
	"spotify-legacy"
	"insomnia-bin"
	"android-messages-desktop"
	"postman-bin"
	"google-chrome"
)

for i in "${pamac[@]}"; do
	printf 'Installing ' "$m"
	pamac build "$i" --no-confirm $mypass
	printf '\n'
done

# Desktop Laptop Specific installs

PS3='Is this a Laptop or desktop? '
options=("laptop" "desktop" "Quit")
select opt in "${options[@]}"; do
	case $opt in
	"laptop") 
	echo "Nothing to do"
	printf '\n'
	;;
	"desktop")
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

		for i in "${virtualization[@]}"; do
			printf 'Installing ' "$m"
			yes | sudo pacman -S "$i"
		done
		printf '\n'
		# KVM/Qemu #
		# Setup Service #
		sudo systemctl enable libvirtd.servizce
		sudo systemctl start libvirtd.service
		printf '\n'
		;;
	"Quit")
		break
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done

# AMD GPU check

PS3='AMD or NVIDIA?  '
options=("AMD" "NVIDIA" "Quit")
select opt in "${options[@]}"; do
	case $opt in
	"AMD")
		yes | sudo pacman -S mesa
		printf '\n'
		;;
	"NVIDIA") ;;
		echo "Nothing to do"
		printf '\n'
		"Quit")
		break
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done


#################### Complete Statement #########################

PS3='Installation complete, RESTART REQUIRED '
options=("Restart" "Power-Off" "Quit")
select opt in "${options[@]}"; do
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
	*) echo "invalid option $REPLY" ;;
	esac
done
