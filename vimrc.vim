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


" vim-plug
" https://github.com/junegunn/vim-plug
let g:plug_window="topleft new"

if has("win32") || has("win64")
  call plug#begin('~/vimfiles/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

"color schemes
Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'tomasr/molokai'
"Plug 'yosiat/oceanic-next-vim'
"Plug 'mhumeSF/one-dark.vim'
"Plug 'gosukiwi/vim-atom-dark'
"Plug 'altercation/vim-colors-solarized'

"vim functional plugins
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/ctags.vim'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
"Plug 'raichoo/haskell-vim'
Plug 'wangxd18/ultisnips'
Plug 'groenewege/vim-less'
"Plug 'jtratner/vim-flavored-markdown'
"Plug 'nelstrom/vim-markdown-preview'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/ragtag.vim'
Plug 'duff/vim-scratch'
Plug 'rstacruz/sparkup'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/TagHighlight'
"Plug 'nathanaelkane/vim-indent-guides'

" html
Plug 'othree/html5.vim'

" css, scss
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'

" javascript
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ramitos/jsctags'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Hack
Plug 'bmcgavin/hack-vim'

" xhp
Plug 'mxw/vim-xhp'

" not using
"Plug 'jelera/vim-javascript-syntax'
"Plug 'sheerun/vim-polyglot' " polyglot is breaking some filetype syntax
"Plug 'junegunn/vim-easy-align'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'frozen': 1 }

Plug 'flowtype/vim-flow'

" Add plugins to &runtimepath
call plug#end()


"Helptags

if has("mac")
  " ~/local as default workspace
  cd ~/local
endif

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

au BufRead,BufNewFile *.mustache set filetype=html

" fold setting
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml, setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR


if has("win32") || has("win64")
  language messages en.utf-8
endif
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileencodings=utf-8,chinese,latin-1
set fileformats=dos,unix

set t_Co=256


" colorscheme
set background=dark
"colorscheme molokai
"let g:hybrid_use_Xresources = 1
"colorscheme OceanicNext
colorscheme hybrid_material


set number
set numberwidth=4

set wrap
set nolinebreak

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
set wildignore+=.tmp/**
set wildignore+=*node_modules*
set wildignore+=*bundle*
set wildignore+=*bower_components*
set wildignore+=*.png,*.jpg,*.gif,*.ico


" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1



"分割窗口时保持相等的宽/高

"set nobackup
"set noswapfile
set writebackup
set backupdir=~/tmp/backup//
set directory=~/tmp/swap//
set undodir=~/tmp/undo//
set undofile

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
  set hlsearch
  set clipboard=unnamed
endif

"取消高亮, 同时关闭各种小窗口
nnoremap <silent> <leader><space> :nohlsearch<cr>:lclose<cr>:cclose<cr>:pclose<cr>

"窗口
if has("gui_running")
	if has("win32") || has("win64")
    set guifont=Monaco:h12:cANSI,Consolas:h12:cANSI
	elseif has("mac")
    set guifont=Monaco:h16
  else
    if has("gui_gtk2")
      set guifont=Monaco:h12,Consolas:h12
      set guifontwide=Microsoft\ Yahei\ 12,WenQuanYi\ Zen\ Hei\ 12
    elseif has("x11")
      " Also for GTK 1
      set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    endif
  endif

  "去掉工具栏
  set guioptions=e
  "set cursorline

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
" reduce delay when leaving insert mode
set ttimeoutlen=50


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
nnoremap <c-g> G
nnoremap <leader>1 :set filetype=javascript<cr>
nnoremap <leader>2 :set filetype=html<cr>
nnoremap <leader>3 :set filetype=php<cr>
nnoremap <leader>4 :set filetype=css<cr>

map Q <Nop>
map K <Nop>

inoremap jk <esc>
"inoremap <esc> <nop>
"Paste in ic Modes
noremap! jj <c-r>"
cnoremap gj <c-r>+
"Global Clipboard
nnoremap <leader>g "+
vnoremap <leader>g "+
"重新选取刚刚粘贴的内容
nnoremap <leader>v V`]
"快速修改当前目录
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

"buffer
nnoremap <silent> <leader>bn :bnext<cr>
vnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <c-tab> :bprev<cr>
vnoremap <silent> <c-tab> :bprev<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
vnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>bu :bunload<cr>
vnoremap <silent> <leader>bu :bunload<cr>
nnoremap <silent> <leader>bd :bdelete<cr>
vnoremap <silent> <leader>bd :bdelete<cr>

"窗口
nnoremap <leader>wv <c-w>v<c-w>l
nnoremap <leader>wc <c-w>c
nnoremap <leader>wo <c-w>o
nnoremap <silent> <leader>q :close<cr>

"窗口调整
nnoremap <leader>wh <c-w>H
nnoremap <leader>wj <c-w>J
nnoremap <leader>wk <c-w>K
nnoremap <leader>wl <c-w>L
"多窗口移动
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

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
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-z> <esc>zzi

nnoremap j gj
nnoremap k gk

nnoremap <c-a> ^
nnoremap <c-e> $
vnoremap <c-a> ^
vnoremap <c-e> $

"surround
let g:surround_60 = "<\r>" "<
let g:surround_40 = "(\r)" "(

" Matchit
" mapping <tab> to % in visual mode
nmap <tab> %
vmap <tab> %
omap <tab> %

"bufExplorer
let g:bufExplorerSortBy           = 'mru'
let g:bufExplorerSplitRight       = 0
let g:bufExplorerSplitVertical    = 1
let g:bufExplorerSplitVertSize    = 30
let g:bufExplorerUseCurrentWindow = 1
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"netrw
let g:netrw_winsize = 30
noremap <silent> <leader>fe :Sexplore!<cr>

"NERDTree
noremap <silent> <leader>nt :NERDTree<cr>
let NERDTreeQuitOnOpen = 1

"Scratch
noremap <leader>ss :Scratch<cr>

"jsbeautify
"keymapp setted as <leader>jf

"EasyClip
noremap <leader>yr :Yanks<cr>
let g:EasyClipShareYanks                   = 1
let g:EasyClipShareYanksFile               = '.easyclip'
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipYankHistorySize              = 1000
let g:EasyClipAutoFormat                   = 1
let g:EasyClipUsePasteToggleDefaults       = 0
if has("win32") || has("win64")
  let g:EasyClipShareYanksDirectory = $VIMBACKUP
else
  let g:EasyClipShareYanksDirectory = "~/.vimbackup"
endif

" Airline
let g:airline_theme = 'hybrid'

"Ag
"let g:ag_prg="ag --vimgrep --smart-case"
nnoremap <leader>a :Ag  <left>


"MRU
nnoremap <silent> <leader>fm :MRU<cr>
let MRU_File = $HOME."/.vimbackup/.vim_mru_files"
let MRU_Max_Entries = 2000

"YouCompleteMe options
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt-=preview
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py"

" delimitMate
" enable expansion
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2

"better whitespace
"auto strip whitespace on save
"let g:strip_whitespace_on_save = 1
highlight ExtraWhitespace ctermbg = green guibg = #AFFD46i
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd FileType c,cpp,java,php,ruby,python,html,css,scss,javascript,jsx autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic settings
let g:syntastic_javascript_checkers      = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_loc_list_height          = 5
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "passive_filetypes": ["javascript"] }
noremap <leader>sc :SyntasticCheck<cr>
noremap <leader>st :SyntasticToggleMode<cr>
noremap <silent> <leader>ln :lnext<cr>
noremap <silent> <leader>lp :lprev<cr>

" TernJs settings
noremap <leader>td :TernDef<cr>
noremap <leader>tr :TernRefs<cr>

" CtrlP setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|tmp)|dist|images)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|sw.*)$',
\}
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth   = 25
let g:ctrlp_mruf_max    = 500
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("u")': ['<kPageUp>'],
      \ 'PrtSelectMove("d")': ['<kPageDown>'],
      \ 'ToggleType(1)':      ['<PageDown>'],
      \ 'ToggleType(-1)':     ['<PageUp>']
      \}

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" javascript-libraries-syntax
let g:used_javascript_libs = 'angularjs,angularuirouter,react'

" Add some shortcuts for ctags
map <Leader>tt <esc>:TagbarToggle<cr>

"Tabular
nnoremap <leader>tb :Tabularize /=
vnoremap <leader>tb :Tabularize /=
nnoremap <leader>tbz :Tabularize /:\zs<left><left><left>
vnoremap <leader>tbz :Tabularize /:\zs<left><left><left>


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

"Flow
let g:flow#enable = 0

"XHP
autocmd FileType php setlocal iskeyword+=:,-


