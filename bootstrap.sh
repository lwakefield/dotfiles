#! /bin/bash

# Set up vim
git clone https://github.com/gmarik/Vundle.vim.git ./vim/vim/bundle/Vundle.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -sdf ~/dotfiles/vim/vim/ ~/.vim

# Set up i3
ln -sdf ~/dotfiles/i3/ ~/.config

# Set up base16
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
ln -s ~/dotfiles/zshrc ~/.zshrc
