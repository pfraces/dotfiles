# if not running interactively, don't do anything
[ -z "$PS1" ] && exit

# start a tmux session
if [[ -z "$TMUX" ]]
then tmux new-session && exit
fi

# time format for a great output of the `history` command
export HISTTIMEFORMAT='[%F %T] '

# ignore dupliated and empty commands for cleaner history
export HISTCONTROL=ignoreboth # ignoredups & ignorespace

# share history between terminals
shopt -s histappend
export HISTSIZE=100000
export HISTFILESIZE=100000

history -a
history -c
history -r

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# the pattern "**" used in a pathname expansion context will
# match all files and zero or more subdirectories
shopt -s globstar

# sources
source $HOME/.bashrc.aliases
source $HOME/.bashrc.completions
source $HOME/.bashrc.functions

# env variables
export EDITOR='vim'
export VISUAL=$EDITOR
export CHROME_BIN=/usr/bin/chromium
export PATH=$PATH:~/.bin:~/bin
