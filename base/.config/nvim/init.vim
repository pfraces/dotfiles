if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

set number
set cursorline
set nowrap
set clipboard=unnamed " use X clipboard
set hidden " unsaved buffers can be hidden
set title " change the terminal's titleo

" disable data lost protection
set nobackup
set noswapfile

" indentation
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

" search
set ignorecase
set smartcase
set incsearch

" more natural split opening
set splitbelow
set splitright

color jellybeans
let mapleader="\<Space>"

source ~/.config/nvim/bindings.vim
