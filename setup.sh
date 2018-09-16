#!/bin/bash

DOT_FILES=(.tmux.conf .vimrc .zshrc .zshenv)

for file in ${DOT_FILES[@]}
do
    if [ -f ~/$file ]
    then
        rm ~/$file
    fi
    ln -s ~/dotfiles/$file ~/$file
done
