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
