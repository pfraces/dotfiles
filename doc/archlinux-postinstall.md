Archlinux postinstall
=====================

Install utilities
-----------------

    sudo packer -S --noconfirm \
      tmux \
      gvim \
      git \
      bash-completion \
      downgrade \
      the_silver_searcher \
      xclip \
      xkill \
      htop

Z
-

    sudo packer -S z-git

**~/.bashrc**

    . /usr/lib/z.sh

Chromium
--------

    sudo packer -S --noconfirm chromium
    sudo pacman -Rscn firefox

### Update flash plugin

    sudo packer -S --noconfirm chromium-pepper-flash

Restart chromium to enable the plugin

### Extensions

*   Adblock Plus
*   Postman + Postman launcher
*   Screen Capture
*   Save as PDF (from pdfcrowd.com)

### Configuration

*   **[on]** Disable cache while devtools is open
*   **[on]** Log XMLHttpRequests
*   **[off]** Enable JS source maps
*   **[off]** Enable CSS source maps

Desktop environment
-------------------

### Custom

    sudo packer -S --noconfirm \
      dmenu \
      slock \
      scrot

### Xfce

General key-bindings

    xfce4-keyboard-settings

*   slock (Super+Z)
*   xfce4-screenshooter (Print)
*   xfce4-terminal (Super+Return)
*   xfrun4 (Super+P)

Window manager key-bindings

**Configuration > Window Manager > Keyboard**
