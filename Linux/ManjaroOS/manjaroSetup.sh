

### Date published: Thurs Nov 12
### Description: Personal Install Script for after fresh install

## UPDATE March 24th -- Removed the loops to make this more of a automated process and removing egpu nad gpu driver config... dont need it anymore

## ========== +++++ [[ Variables ]] ++++ ============ ##

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

declare -a pacmanPrograms=(
	"chrome-gnome-shell"
	"tilda"
	"remmina"
	"powerline-fonts"
	"gimp"
	"brave"
	"vim"
	"docker"
	"code"
	"Git"
	"archey3"
	# virtual machine
	"virt-manager"
	"virt-viewer"
	"qemu"
	"vde2"
	"ebtables"
	"dnsmasq"
	"bridge-utils"
	"openbsd-netcat"
	#gaming
	"steam"
	"discord"
	)

declare -a aurPrograms=(
	"slack-desktop"
	"spotify-legacy"
	"android-messages-desktop"
	"google-chrome"
	"amazon-workspaces-bin"
	"insomnia-bin"
	"postman-bin"
	"azuredatastudio-bin"
	#gaming
	"shadow-beta"
)


for i in "${pacmanPrograms[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	yes | sudo pacman -S "$i"
done
printf '\n'

# libvirt service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service


for i in "${pamac[@]}"
do
	echo 'Installing ' 
	echo "$i"
	printf '\n'
	echo -ne $pass | pamac build "$i" --no-confirm
	printf '\n'
done


# Oh my zsh
# https://ohmyz.sh/

printf '\n'

## ========== +++++ [[ AUR Programs ]] ++++ ============ ##
declare -a pamac=(
)


## ========== +++++ [[ VPN | Private Internet Access ]] ++++ ============ ##


echo 'Downloading Private Internet Access VPN'
wget 'https://installers.privateinternetaccess.com/download/pia-linux-2.5.1-05676.run'
sh pia-linux-*.run

echo 'PIA installed'

rm pia-linux-*.run

## ========== +++++ [[ GPU INSTALL ]] ++++ ============ ##


##### ((EGPU)) ######
#  read -p "Epu Installed and this is Gnome?" choice
# case $choice in
#  y|Y ) 
# yes | sudo pacman -S gksu
# mkdir ~/Repos
# cd ~/Repos
# git clone https://github.com/Ralph-Fonz/eGPU_Switcher.git
# cd eGPU_Switcher
# chmod +x egpu-switcher.sh
# sudo cp eGpuSwitcher.desktop ~/.local/share/applications/
# cd ~/
# printf '\n'
#  ;;
#  n|N )
#  break;;
#  *) echo "invalid";;
#  esac



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

