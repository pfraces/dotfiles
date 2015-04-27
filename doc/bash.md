Bash configuration
==================

The following configuration is expected to be done in **~/.bashrc** or in a script `source`d from there

Misc config
-----------

### If not running interactively, don't do anything

```bash
[ -z "$PS1" ] && return
```

### Don't put duplicate lines or lines starting with space in the history.

```bash
HISTCONTROL=ignoreboth
```

### Share history between terminals

```bash
shopt -s histappend
export HISTSIZE=100000
export HISTFILESIZE=100000

history -a
history -c
history -r
```

Source: https://news.ycombinator.com/item?id=7982031

Misc aliases
------------

```bash
alias sudo='sudo '
alias ls='ls --color=auto'
alias find='find . -name'
alias ag='ag --smart-case --pager="less -R"'
```

Misc functions
--------------

### open

Since `xdg-open` does not accept multiple args we need this workaround

```bash
function open () {
    until test "$#" = "0"
    do
        xdg-open $1
        shift
    done
}
```

### xapp

Get the app command by clicking in the app window

```bash
function xapp () {
    winid=$(xprop | awk '/_NET_WM_PID\(CARDINAL\)/{ print $NF }')
    ps -e | grep $winid | awk '{ print $NF }'
}
```

### mcd

Create a directory and go to it

```bash
function mcd () {
    mkdir -p $1
    cd $1
}
```

### lsport

List used ip ports

```bash
function lsport () {
    lsof -Pnl +M -i4 | grep $1
}
```
