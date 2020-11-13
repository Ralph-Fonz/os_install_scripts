#!/usr/bin/bash

######################## Pre-REQ #############################
sudo apt update
sudo apt upgrade -y
echo 'Update and Upgrade complete'

# Create install folder
cd ~/ \
mkdir installs \
cd installs \
echo 'Created installer folder'



################### Standard Installs ########################
declare -a programs=(
    "xclip"
    "snap"
    "gdebi-core wget"
    "openssh-server"
    "fonts-powerline"
    "vim"
    "docker.io"
)

# Loop over array above and install programs
for i in "${programs[@]}"; do
	echo 'Installing ' "$i"
	sudo apt install "$i" -y
	printf '\n'
done

# Oh my zsh
# https://ohmyz.sh/
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


################## Install Virtualization #######################
declare -a virt=(
   "qemu-kvm"
    "libvirt-daemon-system"
    "libvirt-clients"
    "virtinst"
    "cpu-checker"
    "libguestfs-tools"
    "libosinfo-bin"
)

# Loop over array above and install programs
for i in "${virt[@]}"; do
	echo 'Installing ' "$i"
	sudo apt install "$i" -y
	printf '\n'
done

### auto conifgure bridged networking
# https://www.cyberciti.biz/faq/how-to-install-kvm-on-ubuntu-20-04-lts-headless-server/






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
