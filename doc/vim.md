vim
===

Plugins
-------

### pathogen (plugin manager)

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

### airline, tmuxline

    cd ~/.vim/bundle
    git clone https://github.com/bling/vim-airline
    git clone https://github.com/edkolev/tmuxline.vim
    fc-cache -vf

### Syntax highlight

    cd ~/.vim/bundle
    git clone https://github.com/pangloss/vim-javascript.git
    git clone https://github.com/hallison/vim-markdown.git

### fugitive

    cd ~/.vim/bundle
    git clone https://github.com/tpope/vim-fugitive.git

### unite

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimproc.vim
    git clone https://github.com/Shougo/unite.vim
    cd vimproc.vim
    make

### vimfiler

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimfiler.vim
