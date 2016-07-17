#!/bin/bash

DOT_FILES=(.vimrc)

for file in ${DOT_FILES[@]}
do
  ln -s ~/dotfiles/$file ~/$file
done
