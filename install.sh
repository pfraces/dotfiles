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
    exit
  fi

  while test $# -gt 0
  do
    mkdir -p "$HOME/$(dirname $1)" 2> /dev/null
    cp "base/$1" "$HOME/$1"
    shift
  done
}

#
# apply-patch
# ===========
#
# Apply patches to home files
#
# Usage
# -----
#
#     apply-patch <collection> [files...] 
#
#     apply-patch archlinux .bashrc .tmux.conf
#     apply-patch archlinux
#
# If no arguments are passed, all patches from selected platform are applied
#

function apply-patch () {
  if test $# -eq 0
  then
    echo 'err: collection is required' 1>&2
    exit 1
  fi

  collection=$1
  shift

  if test $# -eq 0
  then
    apply-patch $collection $(find "patches/$collection/" -type f | cut -sd / -f 3-)
    exit
  fi

  while test $# -gt 0
  do
    mkdir -p "$HOME/$(dirname $1)" 2> /dev/null
    touch "$HOME/$1"
    patch "$HOME/$1" "patches/$collection/$1"
    shift
  done
}

#
# install.sh
# ==========
#
# Install base files and apply all patches from selected collection
#
# Usage
# -----
#
#     ./install.sh [patch collection]
#
#     ./install.sh archlinux
#     ./install.sh
#
# If no parameters are specified, base files are still installed but no patches
# are be applied
#

install-base

while test $# -gt 0
do
  apply-patch $1
  shift
done
