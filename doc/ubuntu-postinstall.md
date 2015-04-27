Ubuntu (14.04) Postinstall
===========================

System upgrade
--------------

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get autoremove

Install synaptic
----------------

    sudo apt-get install synaptic

Create custom launchers with super user privileges
--------------------------------------------------

Install `gksudo` command

    sudo apt-get install gksu

Copy the launcher you want to edit to your user defined launchers directory

    cp /usr/share/applications/synaptic.desktop ~/.local/share/applications

Edit the launcher by adding `gksudo` before the launcher command in the `Exec` directive

    Exec=gksudo synaptic-pkexec

Source: http://askubuntu.com/a/68023

Install utilities (using synaptic)
----------------------------------

    sudo apt-get install \
        tmux \
        vim-gtk \
        git \
        silversearcher-ag \
        chromium-browser \
        pepperflashplugin-nonfree \
        meld \
        xclip \
        gpick

Install utilities (from PPAs)
-----------------------------

### nodejs

    sudo apt-get update
    sudo apt-get install -y python-software-properties python g++ make
    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs

Source: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#ubuntu-mint-elementary-os

### sublime text 3

    sudo add-apt-repository ppa:webupd8team/sublime-text-3
    sudo apt-get update
    sudo apt-get install sublime-text-installer

Source: http://www.webupd8.org/2013/07/sublime-text-3-ubuntu-ppa-now-available.html

### atom

    sudo add-apt-repository ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install atom
    
Source: http://www.webupd8.org/2014/05/install-atom-text-editor-in-ubuntu-via-ppa.html

Install grip - github readme instant preview
--------------------------------------------

    sudo apt-get install python-pip
    sudo pip install grip

To use it, simply:

    grip

Then visit `localhost:5000` to view the `readme.md` file at that location

You can also specify your own file:

    grip CHANGES.md

And change port:

    grip 8080

Specifically render GitHub-Flavored Markdown, optionally with repo context:

    grip --gfm --context=username/repo issue.md

Source: http://stackoverflow.com/a/13781363/1815446

Ubuntu config
-------------

### Avoid double-typing password in lock screen

    Settings -> Brightness and Lock -> Lock [OFF]

Source: http://simionbaws.ro/linux/ubuntu-14-04-lock-screen-asking-password-twice/

Unity config
------------

Install unity-tweak-tool

    sudo apt-get install unity-tweak-tool

### Change number of workspaces

    Window Manager > Workspace Settings

Source: http://askubuntu.com/a/108306

### Remove 'show desktop' from window switcher

*(Ignore this step if you are going to disable window grouping as shown below)*

    Unity > Switcher > Display "Show Desktop" icon

Source: http://askubuntu.com/a/174457

### Disable window grouping in window switcher

    sudo apt-get install compizconfig-settings-manager
    sudo apt-get install compiz-plugins
    ccsm

*   Disable the keyboard shortcuts for Unity's switcher by unchecking:

        Desktop > Ubuntu Unity Plugin > Switcher > Key to start the switcher > Enabled
        Desktop > Ubuntu Unity Plugin > Switcher > Key to start the switcher in reverse > Enabled

*   Enable the Static Application Switcher by checking:

        Window Management > Static Application Switcher > Enable Static Application Switcher

Source: http://askubuntu.com/questions/68151
