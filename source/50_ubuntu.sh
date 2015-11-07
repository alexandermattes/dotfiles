# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# # Package management
alias update="sudo apt-get -qq update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

# Make 'less' more.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Fix colors in tmux
alias tmux='TERM=xterm-256color tmux' 

# Add cabal to path
PATH=/home/alex/.cabal/bin:$PATH:/home/alex/Programme/bin
