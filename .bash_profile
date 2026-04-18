# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export PATH=/home/libor/.local/bin:$PATH
export EDITOR=vim
export BROWSER=qutebrowser
export TERMINAL=foot
export kalk=galculator
export GTK_THEME=Adwaita:dark
export ADW_DISABLE_PORTAL=1
export ADW_DEBUG_COLOR_SCHEME=prefer-dark

if [ "$(tty)" = "/dev/tty1" ]; then
    exec start
fi
