#!/bin/bash

DOT_FILES=(.tmux.conf .emacs.d .vimrc .zshrc .zshenv .bashrc)

for file in ${DOT_FILES[@]}
do
    ln -Fs $(pwd)/$file ~/$file
done

# Setup dein for vim
DEIN_DIR=~/.cache/dein

if [ ! -d $DEIN_DIR ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm ./installer.sh
fi

