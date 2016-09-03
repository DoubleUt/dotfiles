#!/bin/bash

DOT_FILES=(.tmux.conf .vimrc .zshrc .emacs.d)

for file in ${DOT_FILES[@]}
do
    ln -s ~/dotfiles/$file ~/$file
done
