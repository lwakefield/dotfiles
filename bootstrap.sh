#! /bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ./vim/vim/bundle/Vundle.vim

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -sdf ~/dotfiles/vim/vim/ ~/.vim
ln -sdf ~/dotfiles/i3 ~/.i3
