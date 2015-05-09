vim
===

Plugins
-------

### pathogen (plugin manager)

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

### airline

    cd ~/.vim/bundle
    git clone https://github.com/bling/vim-airline

### vimproc

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimproc.vim
    cd vimproc.vim
    make

### unite

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/unite.vim

### vimfiler

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimfiler.vim

### Code highlight plugins

    cd ~/.vim/bundle
    git clone https://github.com/pangloss/vim-javascript.git
    git clone https://github.com/hallison/vim-markdown.git

Extras
------

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
