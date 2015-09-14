"For Windows:
"set env_var $MYVIMRC to this file
"add 'source $MYVIMRC' into the vimrc file
"set env_var $CUSTOMVIMRUNTIME to the vimfiles path
"set env_var $VIMBACKUP to backup/undofile path. if not set, the default is $TEMP
"
"For Linux:
"use install.sh to set symbolic link to the vim configuration

set nocompatible

"if has("win32") || has("win64")
  "set runtimepath=$CUSTOMVIMRUNTIME,$VIMRUNTIME,$CUSTOMVIMRUNTIME/after
"endif


" Required Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/ctags.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'raichoo/haskell-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'wangxd18/jsbeautify'
Plugin 'groenewege/vim-less'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-scripts/ragtag.vim'
Plugin 'duff/vim-scratch'
Plugin 'wangxd18/snipmate.vim'
Plugin 'wangxd18/vim-sparkup'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'svermeulen/vim-easyclip'
Plugin 'godlygeek/tabular'
Plugin 'ramitos/jsctags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/TagHighlight'
Plugin 'marijnh/tern_for_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mxw/vim-jsx'


" All of your Plugins must be added before the following line
call vundle#end()            " required


syntax on
filetype plugin indent on

"Helptags

noremap , ;
noremap \ ,
let mapleader=";"
let g:mapleader=";"


set history=400
set backspace=indent,eol,start
set ruler
set showcmd
set noshowmode
set ambiwidth=double
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set equalalways
set autochdir
set foldmethod=indent

if has("win32") || has("win64")
  language messages en.utf-8
endif
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileencodings=utf-8,chinese,latin-1
set fileformats=dos,unix

set t_Co=256
colo molokai


set number
set numberwidth=4

set wrap
set linebreak

if exists("&colorcolumn")
  set colorcolumn=80
endif

"在输入命令时tab列出匹配项目
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*node_modules*
set wildignore+=*bundle*
set wildignore+=*bower_components*
set wildignore+=*.png,*.jpg,*.gif,*.ico


" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1



"分割窗口时保持相等的宽/高

set nobackup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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
  set clipboard=unnamed
endif

"取消高亮
nnoremap <silent> <leader><space> :nohlsearch<cr>:lclose<cr>:cclose<cr>

"窗口
if has("gui_running")
	if has("win32") || has("win64")
    set guifont=Monaco:h11:cANSI,Consolas:h12:cANSI
	elseif has("mac")
    set guifont=Monaco:h14
  else
    if has("gui_gtk2")
      set guifont=Monaco:h11,Consolas:h11,Luxi\ Mono\ 11
      set guifontwide=Microsoft\ Yahei\ 11,WenQuanYi\ Zen\ Hei\ 11
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
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set linespace=2
set expandtab

" display the status line always
set laststatus=2

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
nnoremap <leader>1 :set filetype=javascript<cr>
nnoremap <leader>2 :set filetype=html<cr>
nnoremap <leader>3 :set filetype=php<cr>
nnoremap <leader>4 :set filetype=css<cr>

inoremap jk <esc>
nmap <tab> %
vmap <tab> %
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
nnoremap <silent> <leader>q :bdelete<cr>
nnoremap <silent> <leader>bn :bnext<cr>
vnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <C-Tab> :bnext<cr>
vnoremap <silent> <C-Tab> :bnext<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
vnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>bu :bunload<cr>
vnoremap <silent> <leader>bu :bunload<cr>
nnoremap <silent> <leader>bd :bdelete<cr>
vnoremap <silent> <leader>bd :bdelete<cr>

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
inoremap <C-z> <esc>zzi
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
let NERDTreeQuitOnOpen = 1

"Scratch
noremap <leader>ss :Scratch<cr>

"jsbeautify
"keymapp setted as <leader>jf

"EasyClip
noremap <leader>yr :Yanks<cr>
let g:EasyClipShareYanks = 1
let g:EasyClipShareYanksFile = '.easyclip'
if has("win32") || has("win64")
  let g:EasyClipShareYanksDirectory = $VIMBACKUP
else
  let g:EasyClipShareYanksDirectory = $HOME."/.vimbackup"
endif
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipYankHistorySize = 1000
let g:EasyClipAutoFormat = 1

"Ack
nnoremap <leader>a :Ack  .<left><left>

"Airline
"let g:airline#extensions#tabline#enabled = 1

"Tabular
nnoremap <leader>tb :Tabularize /

"MRU
nnoremap <silent> <leader>fm :MRU<cr>
let MRU_File = $HOME."/.vimbackup/.vim_mru_files"
let MRU_Max_Entries = 2000

"YouCompleteMe options
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt-=preview

"better whitespace
"auto strip whitespace on save
let g:strip_whitespace_on_save = 1
highlight ExtraWhitespace ctermbg = green guibg = #AFFD46i

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["ruby", "php"],
        \ "passive_filetypes": ["javascript"] }
noremap <leader>sc :SyntasticCheck<cr>
noremap <leader>st :SyntasticToggleMode<cr>

" TernJs settings
noremap <leader>d :TernDef<cr>

" CtrlP setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|images)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth = 25
let g:ctrlp_mruf_max = 500
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("u")': ['<kPageUp>'],
      \ 'PrtSelectMove("d")': ['<kPageDown>'],
      \ 'ToggleType(1)':      ['<PageDown>'],
      \ 'ToggleType(-1)':     ['<PageUp>']
      \}

" Add some shortcuts for ctags
map <Leader>tt <esc>:TagbarToggle<cr>

"Automatically fitting a quickfix window height
"http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$") + 1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Restore cursor to file position in previous editing session
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Tell vim to remember certain things when we exit
"  '100  :  marks will be remembered for up to 100 previously edited files
"  "200 :  will save up to 200 lines for each register
"  :80  :  up to 80 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"200,:80,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END
