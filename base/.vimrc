" be iMproved
set nocompatible

" clean GUI
set guioptions=

" smooth scrolling
set ttyfast
set lazyredraw

" default encoding
set encoding=utf-8

" enable mouse support
set mouse=a

" hide unsaved buffers
set hidden

" more natural split opening
set splitbelow
set splitright

" command tab completion
set wildmenu

" show command as its being typed
set showcmd

" show line numbers
set number

" use OS clipboard
set clipboard=unnamed

" do not wrap long lines
set nowrap

" syntax highlight
syntax on

" show closing chars
set showmatch

" file type detection
filetype plugin indent on

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

" center cursor
set scrolloff=999
set sidescrolloff=999
set virtualedit=all

" auto reload on file change
autocmd CursorHold * checktime

" restore cursor position when opening a file
set viminfo='10,"100,:20,%,n~/.viminfo

function! s:resCur()
  if line("'\"") <= line("$")
    normal! g`"zz
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call s:resCur()
augroup END

" do not leave empty buffers opened
" http://stackoverflow.com/a/10102604
function! s:cleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'bw '.join(buffers, ' ')
  endif
endfunction

autocmd WinEnter * call s:cleanEmptyBuffers()

" -------
" Plugins
" -------

source ~/.vimrc.plugins

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" unite
if executable('ag')
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

call unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'winheight': 10
  \ })

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

function! s:unite_settings()
  call s:unite_keybindings()
endfunction

" vimfiler
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
  \   'safe': 0
  \ })

let g:vimfiler_tree_indentation = 2
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '□'
let g:vimfiler_marked_file_icon = '▣'
let g:vimfiler_readonly_file_icon = ''

function! s:vimfiler_settings()
  " do not show numbers
  setlocal nonumber
endfunction

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_cursor_hold_i = 1

" gitgutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_map_keys = 0

" ------------
" Autocommands
" ------------

" load settings
autocmd FileType unite call s:unite_settings()
autocmd FileType vimfiler call s:vimfiler_settings()

" do not restore cursor position for git commit messages
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" -----
" Theme
" -----

" default pallete
color pablo

" custom pallete
let s:lightgrey = 236
let s:grey = 234
let s:darkgrey = 232

" 80 characters overlength
let s:overlength = 80
let &colorcolumn = s:overlength + 1
execute 'highlight ColorColumn ctermbg=' . s:darkgrey
execute 'highlight NonText ctermbg=' . s:darkgrey

" current line
set cursorline
execute 'highlight CursorLine cterm=NONE ctermbg=' . s:grey

" vertical window separator
execute 'highlight VertSplit ctermfg=' . s:lightgrey . ' ctermbg=' . s:lightgrey

" number / gutter
execute 'highlight LineNr ctermbg=' . s:lightgrey

" command line tab completion
highligh StatusLine cterm=NONE ctermbg=lightblue ctermfg=black
highligh WildMenu ctermbg=black ctermfg=lightblue

" ----------------------
" Key Bindings - General
" ----------------------

" disable ex mode key binding
nnoremap Q <nop>

" tab indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <lt>gv
nnoremap <Tab> >>
nnoremap <S-Tab> <lt><lt>

" tab completion
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"

function! s:unite_keybindings()
  " unite: tab completion
  imap <buffer> <Tab>   <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
endfunction

" ----------------------
" Key Bindings - Control
" ----------------------

" save current buffer
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>i

" create new empty buffer
nnoremap <silent> <C-t> :enew<CR>
inoremap <silent> <C-t> <Esc>:enew<CR>

" close preview or current window
function! s:isPreviewWindowOpened()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&previewwindow") | return 1 | endif
  endfor

  return 0
endfunction

function! s:closePreviewOrCurrentWindow()
  if s:isPreviewWindowOpened() | pclose
  else | close
  endif
endfunction

nnoremap <silent> <C-x> :call <sid>closePreviewOrCurrentWindow()<CR>
inoremap <silent> <C-x> <Esc>:call <sid>closePreviewOrCurrentWindow()<CR>

" ---------------------
" Key Bindings - Leader
" ---------------------

let mapleader=","

" navigate between buffers
nnoremap <silent> <Leader><Tab> :bnext<CR>
nnoremap <silent> <Leader><S-Tab> :bprevious<CR>

" close current buffer
nnoremap <silent> <Leader>x :Bdelete<CR>

" close all buffers except the current one
function! s:bufOnly()
  let l:currentBuffer = bufnr('%')
  bufdo if bufnr('%') != l:currentBuffer | bd | endif
endfunction

nnoremap <silent> <Leader><S-x> :call <sid>bufOnly()<CR>

" file fuzzy find
nnoremap <silent> <Leader>f :Unite file_rec/async -force-redraw<CR>

" toggle file explorer
nnoremap <silent> <Leader>e :VimFilerExplorer -force-hide<CR>

" auto-indent
nnoremap <silent> <Leader>= gg=G

" git
nnoremap <silent> <Leader>gs :Gstatus<CR>

nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hd <Plug>GitGutterPreviewHunk
