let g:mapleader=","
let g:rootmarkers = ['Makefile', 'Rakefile', 'makefile', 'setup.py', 'pom.xml', 'build.xml', '.project', 'BUCK', '.lvimrc', 'README.md', 'package.json']

" Vundle settings
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Solarized'
    if has("gui_running")
        set guioptions=i
        set guifont=DejaVu\ Sans\ Mono\ 14
        set guifontwide=DejaVu\ Sans\ Mono\ 14
    else
        set t_Co=256
    endif
    set background=dark
    "set background=light
    colorscheme solarized
Bundle 'ctrlp.vim'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_switch_buffer = 'Et'
    let g:ctrlp_root_markers = g:rootmarkers
    let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_extensions = ['tag']
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll|pyc|class|gif|png|jpg|jpeg|jar|swp|swo)$',
        \ }
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,tags
Bundle 'fholgado/minibufexpl.vim'
    let g:miniBufExplMaxSize = 2
    let g:miniBufExplBuffersNeeded = 1
    let g:miniBufExplCycleArround = 1
    noremap <C-Down> <C-W>j
    noremap <C-Up> <C-W>k
    noremap <C-Left> <C-W>h
    noremap <C-Right> <C-W>l
    noremap <C-TAB> :MBEbn<CR>
    noremap <C-S-TAB> :MBEbp<CR>
Bundle 'The-NERD-tree'
    let NERDTreeIgnore=['\.$', '\~$', '\.pyc$', '\.class$']
    map <F12> :ToggleNERDTree<CR>
Bundle 'NERD_tree-Project'
    let g:NTPNames = g:rootmarkers
Bundle 'The-NERD-Commenter'
    let NERDShutUp=1
    map <c-m> ,c<space>
Bundle 'carlobaldassi/ConqueTerm'
    "use F10 as a toggle key for bash window
    function! ToggleBashTerm()
        if !exists("g:BashTerm") || g:BashTerm == 0
            let g:BashTerm = 1
            execute 'ConqueTermSplit bash'
        else
            let g:BashTerm = 0
            execute 'close'
        endif
    endfunction
    nmap <F10> :call ToggleBashTerm()<CR>
    imap <F10> <ESC>:call ToggleBashTerm()<CR>
Bundle 'plasticboy/vim-markdown'
    let g:vim_markdown_folding_disabled=1
Bundle 'majutsushi/tagbar'
    map <F4> :TagbarToggle<CR>
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'mbbill/undotree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'godlygeek/tabular'
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
Bundle 'moll/vim-node'
Bundle 'scrooloose/syntastic'
Bundle 'fcitx.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'rking/ag.vim'
    let g:ackprg = 'ag --nogroup --nocolor --column'
Bundle 'dyng/ctrlsf.vim'
    let g:ctrlsf_ackprg = 'ag'
    let g:ctrlsf_auto_close = 0
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
Bundle 'mfukar/robotframework-vim'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'exvim/ex-matchit'
Bundle 'tpope/vim-surround'
Bundle 'elzr/vim-json'

filetype plugin indent on

set nu
set ruler
set cursorline
"set cursorcolumn
set cc=80
syntax on
set fileencodings=utf-8,gb18030,cp936,big5
set autoread
set list
set listchars=tab:>-,trail:-
set expandtab
set hlsearch
set incsearch
set autoindent
set smartindent
set hidden
set linebreak
set tabstop=4
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase

nmap <SPACE> @=((foldclosed(line('.')) < 0)?'zc':'zO')<CR>
if has("unix")
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
else
    map <leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>vs :vsplit <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>s :split <C-R>=expand("%:p:h") . "\\" <CR>
endif

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
set foldlevel=4

"打开目录时不显示隐藏目录和文件，以及.pyc文件。
let g:netrw_hide= 1
let g:netrw_list_hide= '(^\..*|.*\.pyc|.*\.class)'

"AutoCommand
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"读入python文件，设置缩进格式
autocmd BufNewFile,BufRead *.py set cinwords=if,elif,else,for,while,try,expect,finally,def,class,with

"读入C, JAVA文件，设置折叠方式为syntax
autocmd BufNewFile,BufRead *.[ch],*.cpp,*.java set foldmethod=syntax

"读入其它文件，设置折叠方式为indent
autocmd BufNewFile,BufRead *.py,*.sh,*.jade,*.rb,*.js set foldmethod=indent

"绑定自动补全的快捷键<C-X><C-O>到<leader>;
imap <leader>; <C-X><C-O>

"绑定复制到系统剪贴板快捷键
vmap <leader>c "+y
nmap <leader>c "+y

"绑定粘贴系统剪贴板内容快捷键
"imap <leader>v <ESC>"+p "不设置insert模式下的快捷键，因为会造成无法输入,v
vmap <leader>v <ESC>"+p
nmap <leader>v "+p

"设置tab操作的快捷键，绑定:tabnew到<leader>t，绑定:tabn, :tabp到<leader>n,
"<leader>p
map <leader>t :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>

"复制粘贴
cmap <leader>" <C-r>"
cmap <leader>+ <C-r>+

"Ctrl+S
imap <C-s> <ESC>:w<CR>i
nmap <C-s> :w<CR>

"tag设置
autocmd BufNewFile,BufRead *.[ch],*.cpp,*.java,*.py,*.js,Makefile,Rakefile,*.html set tags=.tags;
set autochdir

"有代码更新的时候，自动更新tags
function! GoToProjectRoot()
    if !exists("g:NTPNames")
      let g:NTPNames = g:rootmarkers
    endif
    for filename in g:NTPNames
        let file = findfile(filename, expand("%:p:h") . ';')
        if filereadable(file)
            let ProjectRoot = fnamemodify(file, ':p:h')
            exe "cd " . ProjectRoot
            break
        endif
    endfor
endfunction

function! UpdateTags()
    call GoToProjectRoot()
    let currentDir = expand("%:p:h")
    if currentDir != $HOME
        let cmd = 'ctags -f .tags -R . &'
        " 如果创建tag的命令需要定制，可以采用下面的方式，以makefile的形式来创建tag
        "let cmd = 'make tags'
        let resp = system(cmd)
        "execute cmd
    endif
endfunction

autocmd BufWritePre *.cpp,*.h,*.c,*.py,*.java,*.rb,*.js,*.md,Makefile execute ":StripWhitespace"
autocmd BufWritePost *.cpp,*.h,*.c,*.py,*.java,*.rb,*.js call UpdateTags()

function! RunUnitTest()
    call GoToProjectRoot()
    :make test
endfunction

map <F5>  :call RunUnitTest()<CR>

"session设置
"set sessionoptions=options,buffers,curdir,winsize,winpos,resize
"fu! SaveSess()
    "execute 'mksession! $HOME/.vim/session.vim'
"endfunction

"fu! RestoreSess()
"execute 'so $HOME/.vim/session.vim'
"if bufexists(1)
    "for l in range(1, bufnr('$'))
        "if bufwinnr(l) == -1
            "exec 'sbuffer ' . l
        "endif
    "endfor
"endif
"endfunction

"autocmd VimLeave * call SaveSess()
""autocmd VimEnter * call RestoreSess()
"map <C-l> :call RestoreSess()<CR>
