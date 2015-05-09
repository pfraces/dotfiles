Archlinux postinstall
=====================

Utilities
---------

    sudo packer -S --noconfirm \
        st-git \
        tmux \
        vim \
        git \
        bash-completion \
        downgrade \
        z-git \
        the_silver_searcher \
        xclip \
        xkill \
        htop

Fonts
-----

    sudo packer -S --noconfirm \
        terminus-font \
        ttf-inconsolata \
        ttf-freefont \
        ttf-arphic-uming \
        ttf-baekmuk

Chromium
--------

    sudo packer -S --noconfirm  \
        chromium \
        chromium-pepper-flash

### Extensions

*   Adblock Plus
*   Postman

### Configuration

*   **[on]** Disable cache while devtools is open
*   **[on]** Log XMLHttpRequests
*   **[off]** Enable JS source maps
*   **[off]** Enable CSS source maps

Desktop environment
-------------------

### Custom

    sudo packer -S --noconfirm \
        i3-wm \
        i3status \
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
