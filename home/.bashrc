# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Time format for a great output of the `history` command
export HISTTIMEFORMAT='[%F %T] '

# Ignore dupliated and empty commands for cleaner history
export HISTCONTROL=ignoreboth # ignoredups & ignorespace

# Share history between terminals

shopt -s histappend
export HISTSIZE=100000
export HISTFILESIZE=100000

history -a
history -c
history -r

# Sources

source $HOME/.bashrc.aliases
source $HOME/.bashrc.completions
source $HOME/.bashrc.functions

# Env variables

export EDITOR='gvim -f'
export VISUAL=$EDITOR
export CHROME_BIN=/usr/bin/chromium
export PATH=$PATH:~/.bin:~/bin
