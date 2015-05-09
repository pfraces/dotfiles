vim
===

Plugins
-------

### pathogen (plugin manager)

    $ mkdir -p ~/.vim/autoload ~/.vim/bundle
    $ curl -LSso ~/.vim/autoload/pathogen.vim \
      https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

### statusline: airline

    cd ~/.vim/bundle
    git clone https://github.com/bling/vim-airline

#### config

```vimL
set guifont=terminus
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
```

#### symbols font

[powerline font installation](https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation)

Look for a valid font path with `xset q`

    cd <FONT_PATH>
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    fc-cache -vf <FONT_PATH>

    cd ~/.config/fontconfig/conf.d/
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

### launcher: unite

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/unite.vim

[unite intro](http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/)

To use the async flag, vimproc is required

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimproc.vim
    cd vimproc.vim
    make

#### config

```vimL
" file searching like ctrlp.vim
nnoremap <C-p> :Unite file_rec/async<cr>
```

#### usage

*   open unite: `:Unite <filter>`

*   filters
    *   `file_rec`: recursively search for files under current directory

*   close unite: (from NORMAL mode) `:q`
*   filter results: enter into INSERT mode
*   open selection in current window: `[Enter]`

### file explorer: vimfiler

**Requires unite plugin**

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimfiler.vim

[vimfiler help](https://github.com/Shougo/vimfiler.vim/blob/master/doc/vimfiler.txt)

#### config

Tree icons

```vimL
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
```

Default profile

```vimL
call vimfiler#custom#profile('default', 'context', {
\ 'safe' : 0,
\ 'explorer' : 1,
\ 'split' : 1,
\ 'toggle' : 1
\ })
```

Default explorer

```vimL
let g:vimfiler_as_default_explorer = 1
```

#### usage

*   toggle vimfiler: `:VimFiler`
*   collapse/down/up/expand: `hjkl`
*   mark/unmark entry: `[Space]`

Normal mode default mappings

```
o     (vimfiler_expand_or_edit)
E     (vimfiler_split_edit_file)

~     (vimfiler_switch_to_home_directory)
\     (vimfiler_switch_to_root_directory)
&     (vimfiler_switch_to_project_directory)

r     (vimfiler_rename_file)
K     (vimfiler_make_directory)
N     (vimfiler_new_file)

<BS>  (vimfiler_switch_to_parent_directory)
.     (vimfiler_toggle_visible_ignore_files)
```

### syntax highlight

    $ cd ~/.vim/bundle
    $ git clone https://github.com/pangloss/vim-javascript
    $ git clone https://github.com/hallison/vim-markdown

### colorsheme

    $ cd ~/.vim/bundle
    $ git clone https://github.com/tomasr/molokai

Basic configuration
-------------------

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
