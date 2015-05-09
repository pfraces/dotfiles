vim
===

Plugins
-------

### pathogen (plugin manager)

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim \
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

    fc-cache -vf ~/.fonts

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

Extras
------

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
