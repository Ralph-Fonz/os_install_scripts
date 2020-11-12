#!/usr/bin/bash

declare -a programs=(
	"code"
	"Chromium"
	"chrome-gnome-extension"
	"Git"
	"tilda"
	"tilda"
	"remmina"
)

# PASSWORD PROMPT
read -s -p 'Enter Password: ' + mypassword

# Update #
echo 'Updating'
yes | sudo pacman -Syyu

# Loop over array above and install programs from pacman
for i in "${programs[@]}"; do
	echo 'Installing ' + "$i"
	yes | sudo pacman -S "$i"
done

#AUR

declare -a pamac=(
	"amazon-workspaces-bin"
	"slack-desktop"
	"spotify-legacy"
)

for i in "${pamac[@]}"; do
	printf 'Installing ' "$m"
	no | pamac build "$i"
	yes \
	mypassword \
done

# Desktop Laptop Specific installs

PS3='Is this a Laptop or desktop? '
options=("laptop" "desktop" "Quit")
select opt in "${options[@]}"; do
	case $opt in
	"laptop") ;;

	\
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

		# KVM/Qemu #
		# Setup Service #
		sudo systemctl enable libvirtd.service
		sudo systemctl start libvirtd.service

		;;
	"Quit")
		break
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done

# Add Personal keyboard shortcut #
PS3='Which GUI are you running? '
options=("Gnome" "KDE" "Quit")
select opt in "${options[@]}"; do
	case $opt in
	"Gnome")
		sudo reboot
		;;
	"KDE") ;;

	\
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
		;;
	"NVIDIA") ;;

	\
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
