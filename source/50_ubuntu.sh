# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# # Package management
alias update="sudo apt update && sudo apt upgrade"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias search="apt search"

# Make 'less' more.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Fix colors in tmux
alias tmux='TERM=xterm-256color tmux'

# Extend path
PATH=~/.cabal/bin:$PATH:~/Programme/bin
