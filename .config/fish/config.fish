if status is-interactive
    # Commands to run in interactive sessions can go here

# Set up fzf key bindings
fzf --fish | source

abbr !! --position anywhere --function last_history_item
abbr sudo "sudo"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yup "ya pack -u"

abbr in "sudo pacman -S"
abbr se "pacman -Q"
abbr rem "sudo pacman -Rns"

abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ppp "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push -u github endeavourOS && git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push gitlab endeavourOS"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end

