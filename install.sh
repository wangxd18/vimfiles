#!/bin/bash
dir=${pwd}
bfinder = `echo $HOME/.vim|grep $dir`
#set symbolic link to ~/.vim
if [ "$bfinder" == "" ]
then
  ln -sf $dir ~/.vim
fi

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
git submodule update --init
echo "Bundels installed."

