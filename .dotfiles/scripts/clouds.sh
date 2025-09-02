#!/bin/bash

a="󰏊 Připojit OneDrive"
b="󰏊 Odpojit OneDrive"
c=" Připojit Google Disk"
d=" Odpojit Google Disk"

selected=$(echo -e "$a,$b,$c,$d," | rofi -theme ~/.config/rofi/rofithemes/cloud.rasi -sep ',' -dmenu -p Úložiště)

 if [ "$selected" = "$a" ]; then
   source /home/libor/.dotfiles/scripts/onedrive.sh
 fi  

 if [ "$selected" = "$b" ]; then
   source /home/libor/.dotfiles/scripts/umonedrive.sh
 fi

 if [ "$selected" = "$c" ]; then
   source /home/libor/.dotfiles/scripts/googledrive.sh
 fi  

 if [ "$selected" = "$d" ]; then
   source /home/libor/.dotfiles/scripts/umgoogledrive.sh
 fi

