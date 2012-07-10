# Wang Xudong的 Vim 配置以及插件

作者日常工作环境为 Linux/Windows，经常编辑 JavaScript/HTML/CSS 文件，因此大部分插件都是为这些文件进行优化。

这份配置fork自[sakinijino](https://github.com/sakinijino/vimfiles/),也从[justzero](https://github.com/justzero/vim)和[perfectwork](https://github.com/perfectworks/vim)中借鉴了一些用法。

这份配置的核心思想大部分出于[这篇文章](http://stevelosh.com/blog/2010/09/coming-home-to-vim/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+stevelosh+%28Steve+Losh%29).Vim初学者可以尝试一读。

## 安装

###克隆配置

    git clone git://github.com/wangxd18/vimfiles.git

###设置环境变量

    $MYVIMRC设置为vimfiles/vimrc.vim文件的绝对路径
    $CUSTOMVIMRUNTIME设置为vimfiles目录的绝对路径
    $VIMBACKUP设置为想要Vim存储undo文件的路径，默认为$TEMP

## 升级

在 .vim 目录下执行以下命令

    git pull

升级插件

    git submodule foreach "git checkout master && git pull"

