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

### Shougo suite

    cd ~/.vim/bundle
    git clone https://github.com/Shougo/vimproc.vim
    git clone https://github.com/Shougo/unite.vim
    git clone https://github.com/Shougo/vimfiler.vim
    cd vimproc.vim
    make

### Code highlight plugins

    cd ~/.vim/bundle
    git clone https://github.com/pangloss/vim-javascript.git
    git clone https://github.com/hallison/vim-markdown.git
