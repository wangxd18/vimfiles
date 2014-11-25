# Wang Xudong的 Vim 配置以及插件

作者日常工作环境为 Linux/Windows，经常编辑 JavaScript/HTML/CSS 文件，因此大部分插件都是为这些文件进行优化。

这份配置fork自[sakinijino](https://github.com/sakinijino/vimfiles/),也从[justzero](https://github.com/justzero/vim)和[perfectwork](https://github.com/perfectworks/vim)中借鉴了一些用法。

这份配置的核心思想大部分出于[这篇文章](http://stevelosh.com/blog/2010/09/coming-home-to-vim/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+stevelosh+%28Steve+Losh%29).Vim初学者可以尝试一读。

## 安装

###自动安装

#### Linux

在 $HOME 目录下执行以下命令

    git clone git://github.com/wangxd18/vimfiles.git ~/.vim
    cd ~/.vim && ./install.sh

#### Windows

在 %HOME% 目录下执行

    git clone git://github.com/wangxd18/vimfiles.git %HOME%/vimfiles
    cd %HOME%/vimfiles && install.bat


###windows下手动安装

####克隆配置

    git clone git://github.com/wangxd18/vimfiles.git

####抓取插件

    git submodule update --init

####设置环境变量
    $MYVIMRC设置为vimfiles/vimrc.vim文件的绝对路径
    $CUSTOMVIMRUNTIME设置为vimfiles目录的绝对路径
    $VIMBACKUP设置为想要Vim存储undo文件的路径，默认为$TEMP

####默认配置文件修改
windows为\_vimrc,Linux为~/.vimrc.

    source $MYVIMRC

需要安装ack和jshint(syntastic用于做js的语法检查).

ack的安装参考[这里](https://github.com/mileszs/ack.vim).
windows上ack安装看[这里](http://blog.csdn.net/sxvbc/article/details/6334855).

jshint可以通过node.js的npm安装

    npm install -g jshint

## 升级

在 .vim 目录下执行以下命令

    git pull

升级插件

    git submodule foreach "git checkout master && git pull"

### 安装新插件

在 <code>.vim</code> 目录下执行

    git submodule add '插件的 github 检出地址' 'bundle/插件名'
    git submodule init
    git submodule update
