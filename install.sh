#!/bin/bash

#set symbolic link to ~/.vim
#if [ "`echo "$HOME/.vim"|grep ${PWD}`" == "" ]
#then
  #ln -sf $dir ~/.vim
#fi

if [ ! -d ~/.vimbackup ]
then
    mkdir ~/.vimbackup
fi

if [ -f ~/.vimrc ]
then
    echo "~/.vimrc already exist. Backup it."
    cp ~/.vimrc ~/.vimrc.bak
fi

echo "source $HOME/.vim/vimrc.vim" > ~/.vimrc

echo "Installing bundles..."
vim +PluginInstall +qall
echo "Bundels installed."

