#!/bin/bash
dir=${PWD}
bfinder=`echo $CUSTOMVIMRUNTIME|grep $dir`
echo $bfinder
if [ "$bfinder" == "" ]
then
    echo "export CUSTOMVIMRUNTIME=${dir}" >> ~/.bash_profile
    export CUSTOMVIMRUNTIME=${dir}
fi

bfinder=`echo $MYVIMRC|grep $dir`
echo $bfinder
if [ "$bfinder" == "" ]
then
    echo "export MYVIMRC=${dir}/vimrc.vim" >> ~/.bash_profile
    export MYVIMRC=${dir}/vimrc.vim
fi

bfinder=`echo $VIMBACKUP|grep $dir`
echo $bfinder
if [ "$bfinder" == "" ]
then
    echo "export VIMBACKUP=~/.vimbackup" >> ~/.bash_profile
    export VIMBACKUP=~/.vimbackup
fi

bfinder=`echo $TEMP|grep $dir`
echo $bfinder
if [ "$bfinder" == "" ]
then
    echo "export TEMP=/tmp" >> ~/.bash_profile
    export TEMP=/tmp
fi

mkdir ~/.vimbackup

echo "Installing bundles..."
git submodule update --init
echo "Bundels installed."

echo "Run 'source ~/.bash_profile' to enable this vim config"
echo "PS: To ensure 'sudo vim' works fine, edit /etc/sudoers and "
echo "    modify 'Default env_reset' as 'Default !env_reset'."

