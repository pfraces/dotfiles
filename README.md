dotfiles
========

System configuration

Prerequisites
-------------

*   `git`
*   `lsb_release`

Install
-------

    git clone https://github.com/pfraces/dotfiles
    cd dotfiles
    ./install.sh

### Update fonts cache

    fc-cache -vf

Setup
-----

Create `~/.dotfilesrc` and setup the following env variables:

*   `WIFI_ESSID`
*   `WIFI_KEY`

Vim
---

Install [vim-plug](https://github.com/junegunn/vim-plug)

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Update plugins

    vim -u ~/.vimrc.plugins \
        -c PlugUpgrade \
        -c PlugUpdate \
        -c qall
