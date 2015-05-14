#!/bin/bash

function install () {
  mkdir -p "$HOME/$(dirname $1)" 2> /dev/null
  cp "home/$1" "$HOME/$1"
}

function install_all () {
  install .bash_profile
  install .bashrc
  install .bashrc.aliases
  install .bashrc.functions
  install .bashrc.env

  install .gitconfig
  install .gitignore

  install .i3/autostart
  install .i3/config
  install .i3status.conf

  install .tmux.conf
  install .tmuxline.conf
  install .vimrc
  install .local/share/fonts/PowerlineSymbols.otf
  install .config/fontconfig/conf.d/10-powerline-symbols.conf

  install .xinitrc
  install .config/ranger/rc.conf

  install bin/wifi
  install bin/term
  install bin/dualhead
  install bin/triplehead

  # archlinux
  install .bashrc.archlinux
  install .tmux.conf.archlinux
  install bin/upd

  # ubuntu
  install .bashrc.ubuntu
  install .local/share/applications/st.desktop
}

if test $# -eq 0
then install_all && exit
fi

while test $# -gt 0
do install "$1" && shift
done
