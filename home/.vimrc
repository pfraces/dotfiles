set nocompatible
set encoding=utf-8

noremap <buffer> <Up> <NOP>
noremap <buffer> <Down> <NOP>
noremap <buffer> <Left> <NOP>
noremap <buffer> <Right> <NOP>
noremap <buffer> <BackSpace> <NOP>

inoremap <buffer> <Up> <NOP>
inoremap <buffer> <Down> <NOP>
inoremap <buffer> <Left> <NOP>
inoremap <buffer> <Right> <NOP>
inoremap <buffer> <BackSpace> <NOP>

"motions: level 2
"
"noremap <buffer> <h> <NOP>
"noremap <buffer> <j> <NOP>
"noremap <buffer> <k> <NOP>
"noremap <buffer> <l> <NOP>
"
"inoremap <buffer> <h> <NOP>
"inoremap <buffer> <j> <NOP>
"inoremap <buffer> <k> <NOP>
"inoremap <buffer> <l> <NOP>

nnoremap <silent> n nzz
nnoremap <silent> N Nzz

set showmatch

set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <esc> :nohlsearch<return><esc>

set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

set guioptions-=T
set guioptions-=m
set guioptions-=r

set number

set guicursor+=a:blinkon0

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

call pathogen#infect()

colorscheme distinguished

syntax on
filetype plugin indent on

highlight Cursor guibg=orange guifg=black
highlight OverLength guibg=red guifg=white
match OverLength /\%79v./

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

set laststatus=2
let g:Powerline_symbols = 'fancy'

set guifont=terminus\ 12

map <silent> <C-f> :NERDTreeToggle<CR>
