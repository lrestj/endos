#!/bin/bash

icon="/home/libor/.dotfiles/icons/onedrive.png"
title="❌ Odpojeno"

umount /home/libor/Public/OneDrive &&
notify-send -t 2000 -c min -i $icon "$title" ||
notify-send -t 3000 -i dialog-warning "Něco se pokazilo..."
