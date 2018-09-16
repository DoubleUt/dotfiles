#!/bin/bash

DOT_FILES=(.tmux.conf .vimrc .zshrc .zshenv .config/fish)

for file in ${DOT_FILES[@]}
do
    if [ -f ~/$file ]
    then
        rm ~/$file
    fi
    ln -s $(pwd)/$file ~/$file
done
