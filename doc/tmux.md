tmux
====

*   [the tao of tmux](http://tmuxp.readthedocs.org/en/latest/about_tmux.html)
*   [archlinux wiki](https://wiki.archlinux.org/index.php/tmux)
*   [tmux crash course](http://robots.thoughtbot.com/a-tmux-crash-course)

TODO
----

*   copy to clipboard with mouse selection
*   paste from clipboard with mouse middle button
*   reorder window ids when destroying one of them

config
------

*   `/etc/tmux.conf`
*   `~/.tmux.conf`

### replace `ctrl-b` default prefix with `ctrl-a`

Better to reach. Same as in `screen`.

```
unbind C-b
set -g prefix C-a
bind C-a send-prefix
```

### reload config

*   in command mode: `source .tmux.conf`
*   in config file: `bind r source-file ~/.tmux.conf`

### start windows and panes at 1

```
set -g base-index 1
setw -g pane-base-index 1
```

### mouse support

```
setw -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on
```

### clear scrollback buffer

Clear tmux scroll and clean screen with a single command

```
bind -n C-l send-keys " clear && tmux clear-history" \; send-keys "Enter"
```

*   `bind -n` makes the binding accessible without the prefix
*   `ctrl-l` causes a screen clean (this is not a tmux one)
*   `clear-history` removes scrollback buffer
*   a nested tmux call is used to clear the screen current text from the
    history. the `clear-history` command appears to run in a separate thread
    to `send-keys`.
*   the space before `clean` is a way to ignore that command in bash history
    having `HISTORYCONTROL=ignorespace` enabled in your `~/.bashrc`

key mappings
------------

### sessions

*   create named session: `tmux new -s <session name>`
*   restore session: `tmux attach -t <sesion name>`
*   rename session: `prefix $`
*   detach current client: `prefix d`

### modes

*   normal mode
*   command mode: `prefix :` (exit with `[Esc]`)
*   scroll mode: `prefix [` (exit with `q`)

### windows

*   new window: `prefix c`
*   select window: `prefix [0..9]`
*   move pane to new window: `prefix !`
*   select window by name: `prefix f`
*   rename window: `prefix ,`
*   swap windows: `swap-window -s 3 -t 1`
*   swap current window: `swap-window -t 0`
*   rotate window: `prefix Ctrl-o`

### panes

*   split pane vertical: `prefix %`
*   split pane horizontal: `prefix [double quotes]`
*   move between panes: `prefix [Left|Right|Up|Down]`
*   resize panes: `prefix Ctrl-[Left|Right|Up|Down]`

#### layout

Tmux has several layout presets. (**Meta** is `[Alt]` on my system)

*   `prefix [Space]`: switch between them)
*   `prefix Meta-1`: (even vertical) vertical split, all panes same width
*   `prefix Meta-2`: (Even horizontal) horizontal split, all panes same height
*   `prefix Meta-3`: (Main horizontal) horizontal split, main pane on top,
    other panes on bottom, vertically split, all same width
*   `prefix Meta-4`: (Main vertical) vertical split, main pane left, other
    panes right, horizontally split, all same height
*   `prefix Meta-5`: (Tiled) tile, new panes on bottom, same height before
    same width

system integration
------------------

### start tmux on every login shell

In `~/.bashrc`:

```
if [[ -z "$TMUX" ]]
then (tmux attach || tmux new-session)
fi
```
