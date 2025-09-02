#!/bin/bash

notify-send -u critical -c max -i ~/.dotfiles/icons/help.png "Klávesové zkratky:" "$(cat .dotfiles/scripts/2binds.txt)" 
notify-send -u critical -c maxl -i ~/.dotfiles/icons/help.png "Klávesové zkratky:" "$(cat .dotfiles/scripts/1binds.txt)" 
