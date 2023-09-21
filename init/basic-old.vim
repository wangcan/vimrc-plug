set helplang=cn  " point the language of help
set termencoding=utf-8
language message zh_CN.UTF-8

"--------------------
" Use Vundle to manage bundles
"--------------------
filetype off    " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
"set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
"let path='$VIM/vimfiles/bundle/'
"call vundle#begin(path)

Bundle 'gmarik/Vundle.vim'
"source $VIM/vimfiles/vimrc.vundle
source ~/.vim/vimrc.vundle 

"call vundle#end()

call plug#begin()
Plug 'tpope/vim-sensible'
call plug#end()

"--------------------
" General Settings
"--------------------
set history=100    " keep 100 lines of command line history

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on      " syntax highlight

" terminal color settings
if has("gui_running")  " GUI color and font settings
  set guifont=Courier:h18
  set background=dark 
  set t_Co=256    " 256 color mode
  set cursorline  " highlight current line
  highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
  colors moria
else
  colors evening
endif

set clipboard=unnamed  " yank to the system register (*) by default
set showmatch    " Cursor shows matching ) and }
set showmode    " Show current mode
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu    " wild char completion menu

" ignore these files while expanding wild chars
set wildignore+=.svn,CVS,.git 
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg 

set autoindent    " auto indentation
set incsearch    " incremental search
set backup      " save backup files
"set backupdir=$VIM/vimfiles/bak  " where to put backup file
"set dir=$VIM/vimfiles/tmp  " tell vim where to put swap files
set backupdir=~/.vim/bak  " where to put backup file
set dir=~/.vim/tmp  " tell vim where to put swap files
set copyindent    " copy the previous indentation on autoindenting
set ignorecase    " ignore case when searching
set smartcase    " ignore case if search pattern is all lowercase,case-sensitive otherwise
set nosmarttab    " insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells visualbell t_vb=
set tm=500

autocmd FileType yaml set expandtab

" FOLDING
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" status line
"set laststatus=2
"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
"set statusline+=\ \ \ [%{&ff}/%Y] 
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
" vim-powerline
set laststatus=2
"set t_Co=256
let g:Powerline_symbols='unicode'

fun! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "") 
  return curdir
endfun

fun! HasPaste()
  if &paste
    return '[PASTE]'
  else
    return ''
  endif
endfun

" taglist   
let Tlist_Ctags_Cmd = 'c:/Vim/vimfiles/bin/ctags.exe' " 指定ctags程序的位置  
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compart_Format = 1        " 压缩方式  
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树 (鼠标可以点开)  
let Tlist_Exit_OnlyWindow = 1      " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 0      " 在左侧显示窗口  
let Tlist_WinWidth = 40
let Tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
nmap <silent> <leader>tl :Tlist<cr>  

" --- NERDTree
"nnoremap <silent> <F3> :NERDTreeToggle<CR>
"nnoremap <leader>n :NERDTreeToggle<CR>
" Close vim if the only window left open is the NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree
map <F10> :NERDTreeToggle<CR>
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
let g:NERDTree_title = "NERDTree"
function! NERDTree_Start()
  exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
  return 1
endfunction
 
" minibufexpl  
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1   
"let g:miniBufExplorerMoreThanOne=1         "自动打开  

" winmanager   
let g:winManagerWindowLayout='NERDTree'  
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'  
"let g:winManagerWindowLayout = 'FileExplorer|TagList'  
"let g:winManagerWindowLayout = 'FileExplorer'  
let g:winManagerWidth = 30
let g:defaultExplorer = 0  
let g:AutoOpenWinManager = 1
"nmap wm :WMToggle<cr>:q<cr>  
nmap <silent> wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
"nmap <C-W><C-F> :FirstExplorerWindow<cr>  
"nmap <C-W><C-B> :BottomExplorerWindow<cr>  
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>



" 基本配置
" 不与 Vi 兼容（采用 Vim 自己的操作命令）。
set nocompatible
" 打开语法高亮。
syntax on
" 在底部显示，当前处于命令模式还是插入模式。
set showmode
" 命令模式下，在底部显示，当前键入的指令。
set showcmd
" 支持使用鼠标。
set mouse=a
" 使用 utf-8 编码。
set encoding=utf-8
" 启用256色。
set t_Co=256
" 开启文件类型检查，并且载入与该类型对应的缩进规则。
filetype indent on

" 缩进
" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
set autoindent
" 按下 Tab 键时，Vim 显示的空格数。
set tabstop=4
" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。
set shiftwidth=4
" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格。
set expandtab
" Tab 转为多少个空格。
set softtabstop=4
"

" 外观
" 显示行号
set number
" 光标所在的当前行高亮。
set cursorline
" 设置行宽，即一行显示多少个字符。
set textwidth=80
" 自动折行，即太长的行分成几行显示。
set wrap
" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set linebreak
" 指定折行处与编辑窗口的右边缘之间空出的字符数。
set wrapmargin=2
" 垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set scrolloff=5
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set laststatus=2
" 在状态栏显示光标的当前位置（位于哪一行哪一列）。
set  ruler

" 搜索
" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
set showmatch
" 搜索时，高亮显示匹配结果。
set hlsearch

" 编辑
" 打开英语单词的拼写检查。
"set spell spelllang=en_us
" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
set listchars=tab:»■,trail:■
set list
" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmenu
set wildmode=longest:list,full


set nu                      " 显示行号
set tabstop=4               " 设置软制表符宽度为4
set softtabstop=4           " 设置软制表符宽度为4
set shiftwidth=4            " 设置缩进的空格数为4
set autoindent              " 设置自动缩进：即每行的缩进值与上一行相等
set cindent                 " 使用 C/C++ 语言的自动缩进方式
set cursorline              " 突出显示当前行
set expandtab               " 空格代替制表符
set showmatch               " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set ruler                   " 在状态栏显示光标的当前位置（位于哪一行哪一列）

set guifont=Consolas:h15    " 设置字体和字体大小
colorscheme molokai         " 设置主题为molokai

set nobackup                " 取消备份文件
                            " 默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号~
setlocal noswapfile         " 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noundofile              " 取消生成un文件

set hlsearch                " 设置高亮显示搜索字符串
set showmode                " 在底部显示，当前处于命令模式还是插入模式
set showcmd                 " 命令模式下，在底部显示，当前键入的指令。比如输入快捷键将在底部显示具体命令
set t_Co=256                " 启用256色
set noerrorbells            " 出错时不要发出响声
" 高亮显示
syntax on
syntax enable
" 编码配置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
