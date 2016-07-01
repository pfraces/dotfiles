neovim.js
=========

Requirements
------------

### Panes

  * Tab management
  * Buffer management
  * Window management

### Layout

  * 2-column layout
  * bottom 10 lines height quickfix
  * bottom 10 lines height terminal

### Files

  * File explorer
  * File fuzzy finder

### Code

  * project-wide tab-completion
  * project-wide refactors
  * snippets
  * comment/uncomment

Bugs
----

### startup

  * after opening netrw on startup, vim-plug installation is hidden
  * move `vim-plug` installation to a `VimEnter` autocommand?
  * PlugInstall/PlugUpdate in new buffer at the current window

### netrw

  * open in new buffer at the current window

### terminal

  * closing terminal with `:q` leaves a hidden `bash` buffers
  * closing terminal with `:bd` or `:bw` makes neovim to crash
  * reuse last terminal buffer?
  * do not list terminal buffers
  * integration with git editor
  * enter instert mode when focusing in a terminal window

Roadmap
-------

### general config

  * restore cursor position
  * learn how to manage tabs

### key bindings

  * replace [bloq mays] with [esc]
  * <nop> delete, backspace, arrows in insert mode

### remote plugins

  * create a keymapping for PlugUpdate + UpdateRemotePlugins
  * UpdateRemotePlugins after PlugInstall
  * deoplete: `{ do: 'npm update -g tern' }`
  * neomake: `{ do: 'npm update -g eslint' }`
  * use `nvm` instead of global `eslint` and `tern` installs
  * node-host: how to create a js plugin for neovim

### plugins

  * neovim-remote: installation without pip
  * fzf+unite
  * fugitive+gitgutter
  * ag
  * typescript

### incrementally replace term usage with vim plugins

  * tpope's vim-fugitive
  * tpope's vim-eunuch
  * bind npm scripts (vim-node?)
  * :Ag
  * :Unite / vim-fzf

References
----------

  * <http://vimcasts.org/>
  * <http://learnvimscriptthehardway.stevelosh.com/>

### tips

  * <http://nvie.com/posts/how-i-boosted-my-vim/>
  * <https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/>
  * <http://vim.wikia.com/wiki/Use_Vim_like_an_IDE>

### javascript

  * <https://github.com/vimlab/neojs>
  * <https://davidosomething.com/blog/vim-for-javascript/>
