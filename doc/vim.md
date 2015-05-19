vim plugins
===========

Install [vim-plug](https://github.com/junegunn/vim-plug)

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Update plugins

    vim -u ~/.vimrc.plugins \
        -c PlugUpgrade \
        -c PlugUpdate \
        -c qall
