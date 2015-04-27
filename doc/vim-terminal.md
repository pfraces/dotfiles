vim from the terminal
=====================

running vim from the terminal has the advantage of being executed under a
terminal multiplexer such as `screen` or `tmux`

config
------

we need to configure several components to accomplish this setup:

*   graphical terminal emulator: `xterm` or `rxvt` or `st`
*   terminal multiplexer: `screen` or `tmux`
*   vim

### xterm

In `~/.Xresources`:

    xterm*faceName: Terminus
    xterm*faceSize: 13

In `~/.bashrc`:

    xrdb -merge ~/.Xresources

### st (xterm alternative)

Ubuntu has named it as `stterm` for suckless tools terminal

In `~/.bashrc`:

    alias st='stterm -f "DejaVu Sans Mono:pixelsize=15"'

Desktop file (`./local/share/applications/st.desktop`)

```
[Desktop Entry]
Name=st
GenericName=Terminal
Comment=simple terminal
Exec=/usr/bin/stterm -f "DejaVu Sans Mono:pixelsize=15"
Terminal=false
Type=Application
Icon=utilities-terminal
Categories=System;TerminalEmulator;Utility;
OnlyShowIn=GNOME;Unity;
Actions=New
StartupWMClass=stterm-256color

[Desktop Action New]
Name=New Terminal
Exec=/usr/bin/stterm -f "DejaVu Sans Mono:pixelsize=15"
OnlyShowIn=Unity
```

### tmux

In `~/.tmux.conf

    set -g default-terminal "screen-256color"

### vim

In `~/.vimrc`

    "mouse support from terminal
    set mouse=a

TODO
----

### bugs

*   accented chars are not shown under st

    WORKAROUND: It works with the english keyboard layout

        Glyph              | Spanish layout
        -------------------|---------------
        ` (backquote)      | \
        ^ (caret)          | &

    Other useful relations between spanish and english layouts

        Glyph              | Spanish layout
        -------------------|---------------
        * (star)           | (
        - (hyphen)         | '
        _ (underscore)     | ?
        / (slash)          | -
        ? (question mark)  | _
        \ (backslash)      | ç
        | (pipe)           | Ç
        ; (semicolon)      | ñ
        : (colon)          | Ñ
        [ (square bracket) | `
        ] (square bracket) | +
        { (left bracket)   | ^
        } (right bracket)  | *
        = (equal)          | ¡
        + (plus)           | ¿

*   escape key takes too much time

### integration

*   [DONE] start tmux automatically from bash
*   add shortcut to launch st (win+return?)
*   remap caps lock to escape
*   cohesive key mappings in vim and tmux

### tmux config

*   powerline (tmuxline?)
*   statusbar hints when hidden pane logs anything
*   reload: load .tmux.conf settings with a key mapping
*   remap Ctrl-b to Ctrl-a
*   windows ids relatives to 1

### vim config

*   hlsearch
*   highlight current line
*   show different background color for colums >80 chars
*   change cursor: block in normal, pipe in insert
*   key map to switch line numbers on and off
*   do not save backup files (check tmux can recover a session first)
*   autoload .vimrc when saved

### vim plugins

*   unite

### vim language detection

*   markdown
*   javascript
*   html
*   css
*   lesss

### update documentation

*   improve vimrecover bash function: store backup files in the same place or
    disable backups at all (can tmux recover a crashed session?)
*   remove graphical vim tweaks from documentation
*   check if its needed to replace default terminal in st when using tmux
*   remove xterm info if st is suitable enough
*   test and update git integration
