#!/bin/bash

PacmanApps="gvim hyprland gvfs xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk sddm eos-sddm-theme udiskie simple-scan sddm eos-sddm-theme mako rofi rofimoji  ttf-nerd-fonts-symbols-common ttf-hack-nerd awesome-terminal-fonts yazi fish foot waybar hyprpolkitagent hypridle wlsunset filelight figlet swaybg pcmanfm-qt featherpad libreoffice-fresh-cs qt6ct oxygen-icons brightnessctl btop fastfetch kalk partitionmanager krename mpv vlc okular pamixer pdfarranger qjackctl qpwgraph xournalpp zip p7zip wlsunset kwalletmanager loupe"

AurApps="clipse waypaper brave-bin wlogout hyprshot hyprlock figlet-fonts hypridle"

sudo pacman -Syu
echo "Instalace z repozitáře Arch"
sudo pacman -S $PacmanApps &&
echo "Instalace z repozitáře Aur"
yay -S $AurApps &&
echo "Instalace dokončena"
sudo systemctl enable sddm.service
sleep 3
echo "Kopíruji konfiguraci z repotitáře"
alias cfg='git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'
echo ".cfg.git" >> .gitignore
git clone --bare https://codeberg.org/lrestj/endos.git $HOME/.cfg.git
alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'
cfg checkout -f
cfg config --local status.showUntrackedFiles no
echo "Konfigurace z repozitáře kompletní"


##### END OF FILE #####
