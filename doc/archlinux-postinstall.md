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
        
i3
--

    sudo packer -S --noconfirm \
        i3-wm \
        i3status \
        dmenu \
        slock \
        scrot

Chromium
--------

    sudo packer -S --noconfirm  \
        chromium \
        chromium-pepper-flash

**Extensions**

*   Adblock Plus
*   Postman
