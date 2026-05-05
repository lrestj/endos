# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export BROWSER=qutebrowser
export TERMINAL=foot
export kalk=galculator
export EDITOR=vim
export GTK_THEME=Adwaita:dark
export ADW_DISABLE_PORTAL=1
export ADW_DEBUG_COLOR_SCHEME=prefer-dark
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export GSK_RENDERER=ngl  # Mesa errors workaround
export PATH=$HOME/.local/bin:$PATH

 if [ "$(tty)" = "/dev/tty1" ]; then
     exec start
 fi
