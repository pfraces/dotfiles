#!/bin/bash

#
# install-base
# ============
#
# Install base files in home directory
#
# Usage
# -----
#
#     install-base [files...]
#
#     install-base .bashrc .tmux.conf
#     install-base
#
# If no arguments are passed, all base files are installed
#

function install-base () {
  if test $# -eq 0
  then
    install-base $(find "base/" -type f | cut -sd / -f 2-)
    return
  fi

  while test $# -gt 0
  do
    mkdir -p "$HOME/$(dirname $1)" 2> /dev/null
    cp "base/$1" "$HOME/$1"
    shift
  done
}

#
# append-target
# =============
#
# Append target files to home files
#
# Usage
# -----
#
#     append-target <target> [files...] 
#
#     append-target archlinux .bashrc .tmux.conf
#     append-target archlinux
#
# If no arguments are passed, all files from selected target are appended
#

function append-target () {
  if test $# -eq 0
  then
    echo 'err: target is mandatory' >&2
    exit 1
  fi

  target=$1
  shift

  if test $# -eq 0
  then
    append-target $target $(find "target/$target/" -type f | cut -sd / -f 3-)
    return
  fi

  while test $# -gt 0
  do
    mkdir -p "$HOME/$(dirname $1)" 2> /dev/null
    touch "$HOME/$1"
    cat "target/$target/$1" >> "$HOME/$1"
    shift
  done
}

#
# install.sh
# ==========
#
# Install base files and append targets in order
#
# Usage
# -----
#
#     ./install.sh [targets...]
#
#     ./install.sh archlinux manjaro
#     ./install.sh
#
# If no target is specified, only base files are installed
#

install-base

while test $# -gt 0
do
  append-target $1 > /dev/null
  shift
done
