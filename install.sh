#!/bin/bash

function homeLink () {
  ln -sf $PWD/home/$1 $HOME/$1
}

homeLink .bash_profile
homeLink .bashrc
homeLink .bashrc.aliases
homeLink .bashrc.completions
homeLink .bashrc.functions
homeLink .bin
homeLink .gitconfig
homeLink .gitignore
homeLink .i3
homeLink .i3status.conf
homeLink .tmux.conf
homeLink .vimrc
homeLink .xinitrc
homeLink .Xresources
