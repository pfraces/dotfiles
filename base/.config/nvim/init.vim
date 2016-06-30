" ---------------------
" load helper functions
" ---------------------

source ~/.config/nvim/helpers.vim

" ------------
" load plugins
" ------------

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

color jellybeans " load theme

" -----------------
" load key bindings
" -----------------

let mapleader = "\<Space>" " map <leader> to [space]
source ~/.config/nvim/bindings.vim

" -----------------
" load autocommands
" -----------------

source ~/.config/nvim/autocommands.vim

" ----------
" base setup
" ----------

set number            " show line numbers
set cursorline        " highlight current line
set nowrap            " do not wrap long lines
set clipboard=unnamed " use X clipboard
set hidden            " unsaved buffers can be hidden
set title             " change the terminal's titleo
set showcmd           " show typed keys

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

" disable data lost protection
set nobackup
set noswapfile

" peristent undos
set undodir=~/.config/nvim/undodir
set undofile
