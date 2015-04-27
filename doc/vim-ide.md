use vim like an ide
===================

*   [use vim like an IDE](http://vim.wikia.com/wiki/Use_Vim_like_an_IDE)
*   [buffers vs tabs](https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)
*   [buffers](http://vim.wikia.com/wiki/Buffers)

reload config
-------------

`:so ~/.vimrc`

layout
------

>   A buffer is the in-memory text of a file.
    A window is a viewport on a buffer.
    A tab page is a collection of windows.

### buffers

*   `:e filename` create a new buffer
*   `:bad filename` create a hidden buffer
*   `:ls` list buffers
*   `:b [buffer]` move between buffers
*   `:bd [buffer]` delete buffer

[TODO] Delete buffer without closing its containing window

### windows

Create a new window

*   `:n [filename]`
*   `:vne [filename]`

Move between windows

*   `ctrl-w [hjkl]`
*   `ctrl-w p` (previous)

Close windows

*   `:q`

Resize windows

*   `ctrl-w -` (decrease height)
*   `ctrl-w +` (increase height)
*   `ctrl-w <` (decrease width)
*   `ctrl-w >` (increase width)
*   `ctrl-w _` (max height)
*   `ctrl-w |` (max width)
*   `ctrl-w =` (make windows equally wide and high)
*   `:res [n]`, `:res [+n]`, `:res [-n]`, `:vertical resize ...`

[tinymode key maps](http://www.vim.org/scripts/script.php?script_id=2223)

>   You can use ^W++- instead of ^W+^W+^W-

```vimL
nmap          <C-W>+     <C-W>+<SID>ws
nmap          <C-W>-     <C-W>-<SID>ws
nmap          <C-W><     <C-W><<SID>ws
nmap          <C-W>>     <C-W>><SID>ws
nn <script>   <SID>ws+   <C-W>+<SID>ws
nn <script>   <SID>ws-   <C-W>-<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nmap          <SID>ws    <Nop>
```

Change layout

*   `ctrl-w [HJKL]` (move current window)
*   `ctrl-w T` (move current window to new tab)

statusline: airline
-------------------

    cd ~/.vim/bundle
    git clone https://github.com/bling/vim-airline

### config

```vimL
set guifont=terminus
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
```

### symbols font

[powerline font installation](https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation)

Look for a valid font path with `xset q`

    cd <FONT_PATH>
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    fc-cache -vf <FONT_PATH>

    cd ~/.config/fontconfig/conf.d/
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

launcher: unite
---------------

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/unite.vim

[unite intro](http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/)

To use the async flag, vimproc is required

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimproc.vim
    cd vimproc.vim
    make

### config

```vimL
" file searching like ctrlp.vim
nnoremap <C-p> :Unite file_rec/async<cr>
```

### usage

*   open unite: `:Unite <filter>`

*   filters
    *   `file_rec`: recursively search for files under current directory

*   close unite: (from NORMAL mode) `:q`
*   filter results: enter into INSERT mode
*   open selection in current window: `[Enter]`

file explorer: vimfiler
-----------------------

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/unite.vim
    git clone https://github.com/Shougo/vimfiler.vim

[vimfiler help](https://github.com/Shougo/vimfiler.vim/blob/master/doc/vimfiler.txt)

### config

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

### usage

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
