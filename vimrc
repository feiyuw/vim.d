let g:mapleader=","
let g:rootmarkers = ['.git', '.svn']

" Vundle settings
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'lifepillar/vim-solarized8'
    set background=dark
    set guioptions=i
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 12
    set guifontwide=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 12
    set t_Co=256
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    let g:rehash256 = 1
    colorscheme solarized8_dark
Bundle 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_switch_buffer = 'Et'
    let g:ctrlp_root_markers = g:rootmarkers
    let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit = 1
    "let g:ctrlp_extensions = ['tag']
    let g:ctrlp_custom_ignore = {
        \ 'file': '\v\.(exe|so|dll|pyc|class|gif|png|jpg|jpeg|jar|swp|swo)$',
        \ }
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/proto/*,*/dist/*,*/.cache/*,*/bower_components/*.tags
Bundle 'tacahiroy/ctrlp-funky'
    nnoremap <Leader>f :CtrlPFunky<Cr>
    let g:ctrlp_funky_matchtype = 'path'
Bundle 'FelikZ/ctrlp-py-matcher'
Bundle 'scrooloose/nerdtree'
    let NERDTreeIgnore=['\.$', '\~$', '\.pyc$', '\.class$']
    map <F12> :ToggleNERDTree<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Bundle 'NERD_tree-Project'
    let g:NTPNames = g:rootmarkers
Bundle 'scrooloose/nerdcommenter'
    let NERDShutUp=1
    map <leader>m <leader>c<space>
Bundle 'plasticboy/vim-markdown'
    let g:vim_markdown_folding_disabled = 1
Bundle 'majutsushi/tagbar'
    map <F4> :TagbarToggle<CR>
Bundle 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_tabs = 0
    nmap <TAB> :bnext<CR>
    nmap <S-TAB> :bprevious<CR>
    set noshowmode
    set laststatus=2
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_completion = 1
    nmap <C-]> :YcmCompleter GoTo<CR>
    let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'qf' : 1,
          \ 'notes' : 1,
          \ 'markdown' : 1,
          \ 'unite' : 1,
          \ 'text' : 1,
          \ 'vimwiki' : 1,
          \ 'gitcommit' : 1,
          \}
Bundle 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_python_checkers = ['pyflakes']
    let g:syntastic_java_checkers = ['findbugs']
    let g:syntastic_html_tidy_ignore_errors = ['trimming empty']
Bundle 'digitaltoad/vim-pug'
Bundle 'rking/ag.vim'
    let g:ackprg = 'ag --nogroup --nocolor --column'
Bundle 'mfukar/robotframework-vim'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'elzr/vim-json'
Bundle 'pangloss/vim-javascript'
    let g:javascript_ignore_javaScriptdoc = 1
    let g:javascript_conceal_function   = "ƒ"
    let g:javascript_conceal_null       = "ø"
    let g:javascript_conceal_this       = "@"
    let g:javascript_conceal_return     = "⇚"
    let g:javascript_conceal_undefined  = "¿"
    let g:javascript_conceal_NaN        = "ℕ"
    let g:javascript_conceal_prototype  = "¶"
    let g:javascript_conceal_static     = "•"
    let g:javascript_conceal_super      = "Ω"
    let g:javascript_plugin_flow = 1
Bundle 'mxw/vim-jsx'
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files
Bundle 'othree/html5.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'wavded/vim-stylus'
Bundle 'moll/vim-node'
Bundle 'jiangmiao/auto-pairs'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'fatih/vim-go'
Bundle 'fcitx.vim'
Bundle 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_save_on_switch = 1

filetype plugin indent on

set number
set ruler
set cursorline
"set cursorcolumn
set cc=120
set fileencodings=utf-8,gb18030,cp936,big5,utf-16le
set list
set listchars=tab:>-,trail:-
set expandtab
set hlsearch
set incsearch
set autoindent
set smartindent
set hidden
set linebreak

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
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>
" 在窗口间移动
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l

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

set tabstop=4
set softtabstop=4
set shiftwidth=4
"Python/java/ruby设置Tab宽度为4
autocmd FileType python,java,ruby,robot setlocal tabstop=4 softtabstop=4 shiftwidth=4
"javascript/stylus/jade/html/ejs/tpl设置Tab宽度为2
autocmd FileType pug,jade,html,ejs,tpl,javascript,css,stylus setlocal tabstop=2 softtabstop=2 shiftwidth=2

"python，设置缩进格式
autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,expect,finally,def,class,with

"读入C, JAVA文件，设置折叠方式为syntax
autocmd FileType c,cpp,java,javascript setlocal foldmethod=syntax

"读入其它文件，设置折叠方式为indent
autocmd FileType python,sh,pug,jade,ruby,tpl,ejs setlocal foldmethod=indent

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

"tag设置
autocmd FileType c,cpp,h,java,javascript,python,Makefile,Rakefile setlocal tags=.tags;
set autochdir

"有代码更新的时候，自动更新tags
"function! UpdateTags()
    "call GoToProjectRoot()
    "let currentDir = expand("%:p:h")
    "if currentDir != $HOME
        "let cmd = 'ctags -R --exclude=node_modules --exclude=.git -f .tags . &'
        "" 如果创建tag的命令需要定制，可以采用下面的方式，以makefile的形式来创建tag
        ""let cmd = 'make tags'
        "let resp = system(cmd)
        ""execute cmd
    "endif
"endfunction

"autocmd BufWritePost *.cpp,*.h,*.c,*.py,*.java,*.rb,*.js call UpdateTags()
autocmd BufWritePre * execute ":StripWhitespace"

function! RunUnitTest()
    call GoToProjectRoot()
    :make test
endfunction

map <F5>  :call RunUnitTest()<CR>
