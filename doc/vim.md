# Gvim

## Install pathogen

    $ mkdir -p ~/.vim/autoload ~/.vim/bundle
    $ curl -LSso ~/.vim/autoload/pathogen.vim \
      https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

### Install a theme

    $ cd ~/.vim/bundle/
    $ git clone https://github.com/Lokaltog/vim-distinguished.git

## Basic configuration

`~/.vimrc`

```vimL
"
" misc
"
set nocompatible
set encoding=utf-8
set ignorecase
set smartcase
set nowrap
set guioptions=

"
" indentation
"
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

"
" centered search
"
nnoremap n nzz
nnoremap N Nzz

"
" linenumbers
"
set number
set nuw=5

"
" 80 characters width
" 24 lines height
"
let &columns = &nuw + 80
set lines=24

"
" disable cursor blink
"
set guicursor+=a:blinkon0

"
" restore cursor to file position
"
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

"
" pathogen
"
call pathogen#infect()

"
" theme
"
colorscheme distinguished

"
" code highlight
"
syntax on
filetype plugin indent on

highlight Cursor guifg=#404040 guibg=#A9A9A9
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white

"
" 80 characters warning
"
match OverLength /\%79v./
```

## System integration

### Ubuntu

**~/.bashrc**

```
function vim () {
    (gvim -f "$@" 2>/dev/null &)
}
```

[snippet and explanation source](http://askubuntu.com/questions/132977/how-to-get-global-application-menu-for-gvim#comment503002_132993)

>   The bug is related to gvim's way of going into background mode. gvim -f
    keeps gvim in the foreground. To make the shell run gvim in the background
    we add an &. The parenthesis in (foo &) runs the command in a subshell, so
    that gvim does not become a background process of the current shell. Without
    parenthesis, closing the terminal by clicking the X would also kill gvim.
    function foo () { ... } creates a shell function. We must add /usr/bin/ to
    gvim, otherwise we will get an infinitely recursive function. "$@" passes
    all arguments.

### Git

**~/.gitconfig**

```
[core]
 	editor = gvim -f
```

## Extras

### Code highlight plugins

*   [javascript](https://github.com/pangloss/vim-javascript.git)
*   [markdown](https://github.com/hallison/vim-markdown.git)

### Current line and pos highlight

`~/.vimrc`

    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    set cursorline cursorcolumn

### Vim recover

Recover backup files after a system crash

**~/.bashrc**

```bash
function vimrecover () {
    $(which find) . -name '.*.sw*' |
    while read file
    do
        $(which gvim) -rf $file 2>/dev/null
        rm $file
    done
}
```
