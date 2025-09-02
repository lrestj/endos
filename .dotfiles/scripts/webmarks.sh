#!/bin/bash

icon="/home/libor/.dotfiles/icons/brave.png"
title="Otevřít webovou stránku..."

notify-send -u critical -c nas -i $icon "$title" "$(cat ~/.dotfiles/scripts/webmarks.txt) "
