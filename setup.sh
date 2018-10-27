#!/bin/bash

DOT_FILES=(.tmux.conf .vimrc .zshrc .zshenv .bashrc)

for file in ${DOT_FILES[@]}
do
    ln -Fs $(pwd)/$file ~/$file
done
