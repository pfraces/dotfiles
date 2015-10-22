dotfiles
========

System configuration

Install
-------

    git clone https://github.com/pfraces/dotfiles
    cd dotfiles
    ./install.sh [patches...]

`install.sh` will replace your dotfiles with the `base` settings

Additional patches are available to fine-grained setup. Patches can be provided
as a list of script parameters or be declared in `~/.dotfilesrc`

Setup
-----

**`~/.dotfilesrc`**

    PATCHES=<patches...>
    WIFI_ESSID=<wifi name>
    WIFI_KEY=<wifi password>
