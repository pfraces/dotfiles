" --------------------
" Plugins installation
" --------------------

call plug#begin('~/.vim/plugged')

" close buffer without closing window
Plug 'moll/vim-bbye'

" syntax highlight
Plug 'pangloss/vim-javascript'
Plug 'hallison/vim-markdown'

" status line
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'

" file finder
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

" file browser
Plug 'Shougo/vimfiler.vim'

" autocompletion
Plug 'Shougo/neocomplete.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" ------------------
" Settings - Plugins
" ------------------

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" unite
call unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'winheight': 10
  \ })

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" vimfiler
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', { 'safe': 0 })

let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" gitgutter
let g:gitgutter_sign_column_always = 1

" ------------------
" Settings - General
" ------------------

" be iMproved
set nocompatible

" default encoding
set encoding=utf-8

" enable mouse support
set mouse=a

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

" do not restore cursor position for git commit messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" -----------------
" Settings - Buffer
" -----------------

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

" use OS clipboard
set clipboard=unnamed

" do not wrap long lines
set nowrap

" center cursor
set scrolloff=999
set sidescrolloff=999
set virtualedit=all

" syntax highlight
syntax on

" show closing chars
set showmatch

" file type detection
filetype plugin indent on

" -----------------------
" Settings - Command line
" -----------------------

" tab completion
set wildmenu

" show command as its being typed
set showcmd

" -----
" Theme
" -----

" default pallete
color pablo

" custom pallete
let s:grey = 236
let s:darkgrey = 235

" 80 characters overlength
let s:overlength = 80
let &colorcolumn = join(range(s:overlength + 1, s:overlength + 256), ',')
execute 'highlight ColorColumn ctermbg=' . s:grey
execute 'highlight NonText ctermbg=' . s:grey

" current line
set cursorline
execute 'highlight CursorLine cterm=NONE ctermbg=' . s:darkgrey

" vertical window separator
execute 'highlight VertSplit ctermfg=black ctermbg=' . s:grey
set fillchars+=vert:│

" number / gutter
execute 'highlight LineNr ctermbg=' . s:grey

" command line tab completion
highligh StatusLine cterm=NONE ctermbg=lightblue ctermfg=black
highligh WildMenu ctermbg=black ctermfg=lightblue

" ----------------------
" Key Bindings - General
" ----------------------

" tab indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <lt>gv
nnoremap <Tab> >>
nnoremap <S-Tab> <lt><lt>

" tab completion
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : "\<TAB>"

" tab completion (unite)
function! s:unite_settings()
  imap <buffer> <Tab>   <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
endfunction

autocmd FileType unite call s:unite_settings()

" ----------------------
" Key Bindings - Control
" ----------------------

" save current buffer
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>i

" close current window
nnoremap <silent> <C-x> :close<CR>
inoremap <silent> <C-x> <Esc>:close<CR>

" ---------------------
" Key Bindings - Leader
" ---------------------

let mapleader=","

" navigate between buffers
nnoremap <silent><Leader><Tab> :bnext<CR>
nnoremap <silent><Leader><S-Tab> :bprevious<CR>

" close current buffer
nnoremap <silent><Leader>x :Bdelete<CR>

" file fuzzy find
nnoremap <silent><Leader>f :Unite file_rec/async<CR>

" toggle file explorer
nnoremap <silent> <Leader>e :VimFilerExplorer -force-quit -project<CR>

" git
nnoremap <silent> <Leader>gs :Gstatus<CR>
