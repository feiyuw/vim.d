let g:mapleader=","
set nu
set ruler
syntax on
filetype plugin indent on
set fileencodings=utf-8,gb18030,cp936,big5
set autoread
colo desert
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1
map <F4> :Tlist<CR>
map <F12> :NERDTreeToggle /home/dudu/Workspace<CR>
set list
set listchars=tab:>-,trail:-
set guioptions=i
if has("gui_gtk2")
  set guifont=DejaVu\ Sans\ Mono\ 12
  set guifontwide=DejaVu\ Sans\ Mono\ 12
endif
set expandtab
set smarttab
set foldmethod=indent
"set foldenable
"set foldcolumn=3
"set foldlevel=4
set hlsearch
set incsearch
"set cindent
set autoindent
set smartindent
set linebreak
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd BufNewFile,BufRead *.[ch] set foldmethod=syntax
map <leader>t :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>
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
map <C-S> :mksession! ~/last.vim<CR>
map <C-L> :source ~/last.vim<CR>

"for python
set ofu=syntaxcomplete#Complete
autocmd FileType python runtime! autoload/pythoncomplete.vim
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

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
let g:netrw_list_hide= '(^\..*|.*\.pyc)'

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

