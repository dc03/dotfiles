#!/usr/bin/env sh

if [ -f $HOME/.vimrc ]; then
    mkdir -p $HOME/.vim/autoload
    cd $HOME/.vim/autoload
    git clone https://github.com/junegunn/vim-plug
    vim +PlugInstall +qa
fi

