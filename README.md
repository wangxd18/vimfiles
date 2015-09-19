# Wang Xudong的 Vim 配置以及插件

作者日常工作环境为 Mac/Linux，经常编辑 JavaScript/HTML/CSS 文件，因此大部分插件都是为这些文件进行优化。

这份配置fork自[sakinijino](https://github.com/sakinijino/vimfiles/),也从[justzero](https://github.com/justzero/vim)和[perfectwork](https://github.com/perfectworks/vim)中借鉴了一些用法。

这份配置的核心思想大部分出于[这篇文章](http://stevelosh.com/blog/2010/09/coming-home-to-vim/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+stevelosh+%28Steve+Losh%29).Vim初学者可以尝试一读。

插件采用[Vundle](https://github.com/VundleVim/Vundle.vim)进行管理。

## 安装

###自动安装

#### Linux

在 $HOME 目录下执行以下命令

```
    git clone git://github.com/wangxd18/vimfiles.git ~/.vim
    cd ~/.vim && ./install.sh
```

#### Windows

在 %HOME% 目录下执行

```
    git clone git://github.com/wangxd18/vimfiles.git %HOME%/vimfiles
    cd %HOME%/vimfiles && install.bat
```


###windows下手动安装

####克隆配置

```
    git clone git://github.com/wangxd18/vimfiles.git
```

####抓取插件

```
    vim +PlugInstall +qall
```

####设置环境变量
    $MYVIMRC设置为vimfiles/vimrc.vim文件的绝对路径
    $CUSTOMVIMRUNTIME设置为vimfiles目录的绝对路径
    $VIMBACKUP设置为想要Vim存储undo文件的路径，默认为$TEMP

####默认配置文件修改
windows为\_vimrc,Linux为~/.vimrc.

```
    source $MYVIMRC
```

需要安装ag和eslint(syntastic用于做js的语法检查)

ag的安装参考[这里](https://github.com/rking/ag.vim).

eslint可以通过node.js的npm安装

```
    npm install -g eslint babel-eslint
```

[YouCompleteMe](https://github.com/Valloric/YouCompleteMe) 和 [Tern for Vim](https://github.com/marijnh/tern_for_vim) 用于JavaScript代码补全。


Tagbar依赖[Exuberant Ctags](http://ctags.sourceforge.net/), 将Ctags的压缩包下载解压后, 运行

```
    ./configure
    make
    sudo make install
```


## 升级

打开Vim，运行

```
    :PlugUpgrade
    :PlugUpdate
```

### 安装新插件

插件host在github上时，在 <code>vimrc.vim</code> 的vim-plug插件语句中加入 <code>author/reponame</code> 即可, e.g. <code>tpope/vim-fugitive</code>.

更详细的选项参见[vim-plug](https://github.com/junegunn/vim-plug)。

