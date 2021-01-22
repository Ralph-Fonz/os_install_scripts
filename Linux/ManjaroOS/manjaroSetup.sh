

### Date published: Thurs Nov 12
### Description: Personal Install Script for after fresh install


## ========== +++++ [[ Variables ]] ++++ ============ ##
read -r -p 'Password: ' pass

## ========== +++++ [[ Functions ]] ++++ ============ ##


# PASSWORD PROMPT
# read -s -p 'Enter Password: ' mypass

## ========== +++++ [[ Updating ]] ++++ ============ ##
echo 'Updating'
echo -ne $pass | sudo pacman -Syu
printf '\n'

## ========== +++++ [[ Generic Programs Needed ]] ++++ ============ ##
echo 'Installing Normy Programs'
printf '\n'

declare -a programs=(
	"chrome-gnome-shell"
	"tilda"
	"remmina"
	"powerline-fonts"
	"gimp"
	"brave"
	"vim"
)

for i in "${programs[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	yes | sudo pacman -S "$i"
done
printf '\n'

# Oh my zsh
# https://ohmyz.sh/

printf '\n'

## ========== +++++ [[ AUR Programs ]] ++++ ============ ##
declare -a pamac=(
	"slack-desktop"
	"spotify-legacy"
	"android-messages-desktop"
	"google-chrome"
)

for i in "${pamac[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	echo -ne $pass | pamac build "$i" --no-confirm
	printf '\n'
done

## ========== +++++ [[ VPN | Private Internet Access ]] ++++ ============ ##

read -p "Do you own Private Internet Access?" choice
case $choice in
 y|Y ) 
echo 'Downloading Private Internet Access VPN'
wget 'https://installers.privateinternetaccess.com/download/pia-linux-2.5.1-05676.run'
sh pia-linux-*.run

echo 'PIA installed'

rm pia-linux-*.run

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
for i in "${developerPacman[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	yes | sudo pacman -S "$i"
done
printf '\n'

 ## Install AUR Dev Tools
for i in "${developerAUR[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	echo -ne $pass | pamac build "$i" --no-confirm
	printf '\n'
done
 ;;
 n|N ) 
 break
 ;;
 *) echo "invalid";;
 esac


## ========== +++++ [[ Virtualization Programs ]] ++++ ============ ##

declare -a virtualization=(
	"virt-manager"
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
for i in "${virtualization[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	yes | sudo pacman -S "$i"
done
printf '\n'
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
read -p "Nvidia gpu installed?" choice
case $choice in
 y|Y ) 
echo "Nothing created yet"
printf '\n'
 ;;
 n|N )
 break;;
 *) echo "invalid";;
 esac

# Gaming
read -p "IIs this a gaming machine?" choice
case $choice in
 y|Y ) 
declare -a gamingPacman=(
	"steam"
	"discord"
)

for i in "${gamingPacman[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	yes | sudo pacman -S "$i"
done

declare -a gamingAur=(
	"shadow-tech"
)

for i in "${gamingAur[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	echo -ne $pass | pamac build "$i" --no-confirm
	printf '\n'
done

printf '\n'
 ;;
 n|N )
 break;;
 *) echo "invalid";;
 esac

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'Dont forget to change your theme!'
printf '\n'

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

