" --------------------
" Plugins installation
" --------------------

call plug#begin('~/.vim/plugged')

" status line
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'

" unite
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

" file browser
Plug 'Shougo/vimfiler.vim'

" autocompletion
Plug 'Shougo/neocomplete.vim'

" syntax highlight
Plug 'pangloss/vim-javascript'
Plug 'hallison/vim-markdown'

" git
Plug 'tpope/vim-fugitive'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" ---------------------
" Plugins configuration
" ---------------------

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" vimfiler
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'explorer' : 1,
      \ 'split' : 1,
      \ 'toggle' : 1
      \ })

let g:vimfiler_as_default_explorer = 1

" neocomplete
let g:neocomplete#enable_at_startup = 1

" --------
" Settings
" --------

set nocompatible
set encoding=utf-8

" search
set ignorecase
set smartcase
set incsearch

" indentation
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

" syntax highlight
syntax on

" file type detection
filetype plugin indent on

" mouse support from terminal
set mouse=a

" use OS clipboard
set clipboard=unnamed

" show closing chars
set showmatch

" do not wrap long lines
set nowrap

" center cursor vertically
set scrolloff=999

" tab completion for command mode
set wildmenu

" 80 characters overlength warning
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v./

" restore cursor position when opening a file
set viminfo='10,"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"zz
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" ------------
" Key Bindings
" ------------

" unite
nnoremap <C-p> :Unite file_rec/async<cr>
