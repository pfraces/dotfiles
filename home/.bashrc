# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# start a tmux session
[ -z "$TMUX" ] && [ -n "$DISPLAY" ] && tmux -2 new-session && exit

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

# disable flow control (Ctrl-s / Ctrl-q)
stty -ixon

# sources
source $HOME/.bashrc.aliases
source $HOME/.bashrc.functions
source $HOME/.bashrc.env

case "$(lsb_release --id --short)" in
  "Arch") source $HOME/.bashrc.archlinux ;;
  "Ubuntu") source $HOME/.bashrc.ubuntu ;;
esac

# use ~/.bashrc.local for unversioned settings
if test -f $HOME/.bashrc.local
then source $HOME/.bashrc.local
fi
