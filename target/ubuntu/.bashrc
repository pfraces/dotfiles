
# ------
# ubuntu
# ------

PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source ~/build/z/z.sh
