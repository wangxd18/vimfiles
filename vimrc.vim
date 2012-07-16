"For Windows:
"set env_var $MYVIMRC to this file
"add 'source $MYVIMRC' into the vimrc file
"set env_var $CUSTOMVIMRUNTIME to the vimfiles path
"set env_var $VIMBACKUP to backup/undofile path. if not set, the default is $TEMP
"
"For Linux:
"use install.sh to set symbolic link to the vim configuration
"
set nocompatible

if has("win32") || has("win64")
  set runtimepath=$CUSTOMVIMRUNTIME,$VIMRUNTIME,$CUSTOMVIMRUNTIME/after
endif

call pathogen#infect()
Helptags

noremap , ;
noremap \ ,
let mapleader=";"
let g:mapleader=";"

set history=400
set backspace=indent,eol,start
set ruler
set showcmd
set equalalways
set autochdir
"set foldmethod=indent

if has("win32") || has("win64")
  language messages en.utf-8
endif
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileencodings=utf-8,chinese,latin-1
set fileformats=dos,unix

set number
set numberwidth=4
set expandtab 
"set tabstop=2
set tabstop=4
set shiftwidth=4
set linespace=4

set wrap
if exists("&colorcolumn")
  set colorcolumn=85
endif

"在输入命令时tab列出匹配项目
set wildmenu
set wildmode=list:longest
"分割窗口时保持相等的宽/高

set nobackup
set writebackup
if exists("&undofile")
  if has("win32") || has("win64")
    set undodir=$VIMBACKUP,$TEMP,.
    set backupdir=$VIMBACKUP,$TEMP,.
  else
    set undodir=$HOME/.vimbackup
    set backupdir=$HOME/.vimbackup
  endif
  set undofile
endif
set directory=.,$TEMP

"搜索忽略大小写
set ignorecase
"搜索包含大写时，只搜索大写
set smartcase
set gdefault
set incsearch		" do incremental searching
set showmatch

"隐藏buffer，而不是unload
set hidden

set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]

"t_Co means terminal_colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  "取消高亮
  nnoremap <leader><space> :nohlsearch<cr>
endif

if has("gui_running")
  colo molokai
else
  colo underwater
endif

"窗口
if has("gui_running")
	if has("win32") || has("win64")
    set guifont=Monaco:h12:cANSI,Consolas:h12:cANSI
	elseif has("mac")
    set guifont=Monaco:h14
  else
    if has("gui_gtk2")
      set guifont=Monaco:h12,Consolas:h12,Luxi\ Mono\ 12
    elseif has("x11")
      " Also for GTK 1
      set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    endif
  endif

  "去掉工具栏
  set guioptions=e
  set cursorline

  "窗口最大化
  if has("win32") || has("win64")
    if has("autocmd")
      au GUIEnter * simalt ~x
  else
    set fu
    endif
  endif
else
  set nocursorline
endif

"缩进
if has("autocmd")
  filetype plugin indent on
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
else
  set autoindent
endif

"失去焦点时自动保存
if has("autocmd")
  au FocusLost * :wa
endif

"自动去除utf8 bom
if has("autocmd")
  au BufReadPost *
    \ if &fileencoding=="utf-8" && &bomb |
    \   set nobomb |
    \   write |
    \ endif
endif

"win换行自动转换为unix换行
if has("autocmd")
  au BufReadPost *
    \ if &fileformat=="dos" |
    \   set fileformat=unix |
    \   write |
    \ endif
endif

"js语法高亮脚本的设置
let g:javascript_enable_domhtmlcss=1

"map ctrl+g to G, go to end of file
nnoremap <C-g> G
nnoremap <leader>q :close<cr>
nnoremap <leader>1 :set filetype=javascript<cr>
nnoremap <leader>2 :set filetype=html<cr>
nnoremap <leader>3 :set filetype=php<cr>

inoremap jk <esc>
"inoremap <esc> <nop>
"Paste in ic Modes
noremap! jj <C-r>"
cnoremap gj <C-r>+
"Global Clipboard
nnoremap <leader>g "+
vnoremap <leader>g "+
"重新选取刚刚粘贴的内容
nnoremap <leader>v V`]
"快速修改当前目录
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
"buffer
nnoremap <leader>bn :bnext<cr>
vnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
vnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bu :bunload<cr>
vnoremap <leader>bu :bunload<cr>
nnoremap <leader>bd :bdelete<cr>
vnoremap <leader>bd :bdelete<cr>

"窗口
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>wc <C-w>c
nnoremap <leader>wo <C-w>o
"窗口调整
nnoremap <leader>wh <C-w>H
nnoremap <leader>wj <C-w>J
nnoremap <leader>wk <C-w>K
nnoremap <leader>wl <C-w>L
"多窗口移动
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"禁用鼠标
if has('mouse')
  set mouse=""
endif
"禁用方向键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"插入模式下移动光标
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"surround
let g:surround_60 = "<\r>" "<
let g:surround_40 = "(\r)" "(

"bufExplorer
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30 
let g:bufExplorerUseCurrentWindow=1 
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"netrw
let g:netrw_winsize = 30
noremap <silent> <leader>fe :Sexplore!<cr> 

"NERDTree
noremap <silent> <leader>nt :NERDTree<cr>
noremap <silent> <leader>nf :NERDTreeFind<cr>

"Scratch
noremap <leader>ss :Scratch<cr>

"jsbeautify
"keymapp setted as <leader>jf

"Yankring
if has("win32") || has("win64")
  let g:yankring_history_dir = $VIMBACKUP
else
  let g:yankring_history_dir = $HOME."/.vimbackup"
endif
nnoremap <leader>yr :YRShow<cr>

"Ack
nnoremap <leader>a :Ack  .<left><left>

"Syntastic
" npm install jshint prefered.
let g:syntastic_check_on_open=1

"FuzzyFinder
"let g:fuf_modesDisable=[]
nnoremap <silent> <leader>ff :FufFile<cr>
nnoremap <silent> <leader>fb :FufBuffer<cr>
nnoremap <silent> <leader>fl :FufLine<cr>
nnoremap <silent> <leader>fd :FufDir<cr>
"nnoremap <silent> <leader>fm :FufMruFile<cr>
"nnoremap <silent> <leader>fr :FufRenewCache<cr>

"Tabular
nnoremap <leader>tb :Tabularize /

"MRU
nnoremap <silent> <leader>fm :MRU<cr>
let MRU_File = $HOME."/.vimbackup/.vim_mru_files"
let MRU_Max_Entries = 1000

