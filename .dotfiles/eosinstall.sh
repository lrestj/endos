#!/bin/bash

PacmanApps="gvim hyprland gvfs xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk udiskie simple-scan hplip sddm sddm-eos-theme git mako rofi rofimoji noto-fonts ttf-nerd-fonts-symbols-common ttf-hack-nerd awesome-terminal-fonts yazi foot waybar hyprpolkitagent hypridle wlsunset filelight figlet figlet-fonts swaybg pcmanfm-qt featherpad libreoffice-fresh-cs qt6ct oxygen-icons brightnessctl btop fastfetch kalk partitionmanager krename mpv vlc okular pamixer pdfarranger qjackctl qpwgraph unzip xournalpp zip p7zip wlsunset kwalletmanager loupe"

AurApps="clipse waypaper brave-bin wlogout hyprshot hyprlock hypridle"

sudo pacman -Syu
echo "Instalace z repozitáře Arch"
sudo pacman -S --noconfirm $PacmanApps &&
echo "Instalace z repozitáře Aur"
yay -S --noconfirm $AurApps &&
echo "Instalace dokončena"
sleep 3


##### END OF FILE #####
