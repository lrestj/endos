#!/bin/bash

PacmanApps="neovim hyprland gvfs glxinfo network-manager-applet xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk sddm eos-sddm-theme udiskie simple-scan sddm eos-sddm-theme breeze mako rofi rofimoji  ttf-nerd-fonts-symbols-common ttf-hack-nerd awesome-terminal-fonts yazi fish foot waybar lxqt-policykit hypridle wlsunset filelight figlet swaybg pcmanfm-qt geany libreoffice-fresh-cs qt6ct oxygen-icons brightnessctl btop fastfetch qalculate-qt partitionmanager krename mpv vlc okular pamixer pdfarranger rclone qjackctl qpwgraph xournalpp zip p7zip wlsunset kwalletmanager kwallet-pam loupe nwg-look"

AurApps="clipse waypaper brave-bin wlogout hyprshot hyprlock hypridle"

sudo pacman -Syu
echo "Instalace z repozitáře Arch"
sudo pacman -S $PacmanApps &&
echo "Instalace z repozitáře Aur"
yay -S $AurApps &&
echo "Instalace dokončena"
sudo systemctl enable sddm.service
sleep 3
echo "Kopíruji konfiguraci z repozitáře"
#alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME' &&
echo ".cfg.git" >> .gitignore
git clone --bare https://codeberg.org/lrestj/endos.git $HOME/.cfg.git &&
#alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME' &&
git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f
git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME config --local status.showUntrackedFiles no
echo "Konfigurace z repozitáře kompletní"
echo -e "\n"
echo "Nastavení swap"
echo vm.swappiness=10 | sudo tee /etc/sysctl.d/99-swappiness.conf
echo -e "\n"
echo "Synology nfs shares"
echo -e "\n"

sudo systemctl enable --now nfs-client.target

sudo systemctl enable --now NetworkManager-wait-online.service


#Ověřit:

showmount -e 192.168.77.18



#mounts


sudo mkdir -p /data/nfs/FilmyNas /data/nfs/HudbaNas /data/nfs/Nas &&

sudo chmod -R ugo+rwx /data/nfs

sudo mount -t nfs 192.168.77.18:/volume1/Rodinas /data/nfs/Nas

sudo mount -t nfs 192.168.77.18:/volume1/Hudba /data/nfs/HudbaNas

sudo mount -t nfs 192.168.77.18:/volume1/Filmy /data/nfs/FilmyNas

#add to fstab:
sudo cp /etc/fstab /etc/fstab.bak

cd ~/.dotfiles/scripts/
cat 3fstabnfs | sudo tee -a /etc/fstab
echo -e "\n"

echo "Připojení Nas Synology proběhlo úspěšně"
echo "Soubor fstab nyní vypadá takto:"
echo "-------------------------------------------------------------------------"
echo -e "\n"
cat /etc/fstab

echo -e "\n"
echo "-------------------------------------------------------------------------"
 s

# git@github.com:lrestj/endos.git
# ssh://git@codeberg.org/lrestj/endos.git

git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote remove origin
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add github git@github.com:lrestj/endos.git
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add codeberg ssh://git@codeberg.org/lrestj/endos.git
git config --global user.email "rest@seznam.cz"
git config --global user.name "LrestJ"

echo "Codeberg and Github remote repos added"
echo -e "\n"
echo "END OF INSTALLATION" 


##### END OF FILE #####
