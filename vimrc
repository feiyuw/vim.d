" Vundle settings
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Solarized'
    if has("gui_running")
        set guioptions=i
        set guifont=DejaVu\ Sans\ Mono\ 12
        set guifontwide=DejaVu\ Sans\ Mono\ 12
    else
        set t_Co=256
    endif
    set background=dark
    colorscheme solarized
Bundle 'ctrlp.vim'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_switch_buffer = 'Et'
    let g:ctrlp_root_markers = ['.git', '.hg', 'Makefile', 'makefile', 'setup.py', 'pom.xml', 'build.xml', '.project', 'BUCK']
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
Bundle 'taglist.vim'
    let Tlist_Ctags_Cmd='/usr/bin/ctags'
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
    let Tlist_Use_Right_Window = 1
    map <F4> :Tlist<CR>
Bundle 'minibufexpl.vim'
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
Bundle 'The-NERD-tree'
    let NERDTreeIgnore=['\.$', '\~$', '\.pyc$', '\.class$']
    map <F12> :ToggleNERDTree<CR>
Bundle 'NERD_tree-Project'
    let g:NTPNames = ['Makefile', 'makefile', 'setup.py', 'pom.xml', 'build.xml', '.project', 'BUCK', '.lvimrc']
Bundle 'The-NERD-Commenter'
    let NERDShutUp=1
    map <c-m> ,c<space>
Bundle 'pyflakes.vim'
Bundle 'UltiSnips'
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
Bundle 'carlobaldassi/ConqueTerm'
    nmap <F10> :ConqueTermSplit bash<CR>
Bundle 'Markdown'

filetype plugin indent on

let g:mapleader=","
set nu
set ruler
set cursorline
"set cursorcolumn
syntax on
set fileencodings=utf-8,gb18030,cp936,big5
set autoread
set list
set listchars=tab:>-,trail:-
set expandtab
set foldmethod=indent
"set foldenable
"set foldcolumn=3
"set foldlevel=4
set hlsearch
set incsearch
"set cindent
set autoindent
set smartindent
set hidden
set linebreak
set tabstop=4
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase

autocmd BufNewFile,BufRead *.[ch] set foldmethod=syntax
nmap <SPACE> @=((foldclosed(line('.')) < 0)?'zc':'zo')<CR>
if has("unix")
    map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
else
    map <leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>vs :vsplit <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>s :split <C-R>=expand("%:p:h") . "\\" <CR>
endif
"map <C-S> :mksession! ~/last.vim<CR>
"map <C-L> :source ~/last.vim<CR>

" 插入模式下移动
"inoremap <c-j> <down>
"inoremap <c-k> <up>
"inoremap <c-l> <right>
"inoremap <c-h> <left>

"自动格式化
set formatoptions=tcrqn

"在行和段开始处使用制表符
set smarttab

"在normal模式下使用系统剪贴板
"set clipboard+=unnamed

"Show matching bracets
set showmatch

"Get out of VI's compatible mode
set nocompatible

"Have the mouse enabled all the time
set mouse=a

"Set to auto read when a file is changed from the outside
set autoread


"设置折叠
set foldenable
set foldcolumn=2
set foldlevel=3

"打开目录时不显示隐藏目录和文件，以及.pyc文件。
let g:netrw_hide= 1
let g:netrw_list_hide= '(^\..*|.*\.pyc|.*\.class)'

"AutoCommand
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"读入python文件，设置缩进格式
autocmd BufNewFile,BufRead *.py set cinwords=if,elif,else,for,while,try,expect,finally,def,class

"读入C文件，设置折叠方式为syntax
autocmd BufNewFile,BufRead *.[ch],*.cpp set foldmethod=syntax

"读入其它文件，设置折叠方式为indent
autocmd BufNewFile,BufRead *.py,*.sh,*.java,*.php set foldmethod=indent

"绑定自动补全的快捷键<C-X><C-O>到<leader>;
imap <leader>; <C-X><C-O>

"绑定复制到系统剪贴板快捷键
vmap <leader>c "+y
nmap <leader>c "+y

"绑定粘贴系统剪贴板内容快捷键
"imap <leader>v <ESC>"+p "不设置insert模式下的快捷键，因为会造成无法输入,v
vmap <leader>v <ESC>"+p
nmap <leader>v "+p

"设定开关Taglist插件的快捷键为F4，可以在VIM的左侧栏列出函数列表等
map <F4> :Tlist<CR>

"设置tab操作的快捷键，绑定:tabnew到<leader>t，绑定:tabn, :tabp到<leader>n,
"<leader>p
map <leader>t :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>

