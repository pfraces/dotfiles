#!/bin/bash

#
# install-home
# ============
#
# Selectively install config files
#
# Usage
# -----
#
#     install foo bar qux ...
#
# If no arguments are passed, all config files are installed
#
#     install
#

function install () {
  if test $# -eq 0
  then
    install $(find "home/" -type f | cut -sd / -f 2-)
    exit
  fi

  while test $# -gt 0
  do
    mkdir -p "$HOME/$(dirname $1)" 2> /dev/null
    cp "base/$1" "$HOME/$1"
    shift
  done
}

install $@
