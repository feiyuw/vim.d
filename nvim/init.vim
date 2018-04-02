let g:mapleader=","

syntax on

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/NERD_tree-Project'
Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'feiyuw/robotframework-vim', { 'for': 'robot' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'airblade/vim-gitgutter'
Plug 'wavded/vim-stylus'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'jiangmiao/auto-pairs'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
call plug#end()

" YouCompleteMe
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
      \ 'json' : 1,
      \}

" gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" tmux
let g:tmux_navigator_save_on_switch = 1

" ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" markdown toc
let g:vmt_auto_update_on_save = 0
let g:vmt_dont_insert_fence = 0

" jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" javascript
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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_html_tidy_ignore_errors = ['trimming empty', '<svg> is not recognized!', 'discarding unexpected <svg>', 'discarding unexpected </svg>', '<input> proprietary attribute "step"']

" vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" molokai
set background=dark
set guioptions=i
set guifont=Source\ Code\ Pro\ for\ Powerline\ Book\ 12
set guifontwide=Source\ Code\ Pro\ for\ Powerline\ Book\ 12
set t_Co=256
let g:rehash256 = 1
colorscheme molokai

" ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(exe|so|dll|pyc|class|gif|png|jpg|jpeg|jar|swp|swo)$',
    \ }
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/proto/*,*/dist/*,*/.cache/*,*/bower_components/*.tags

" ctrlp funcky
nnoremap <leader>f :CtrlPFunky<Cr>
let g:ctrlp_funky_matchtype = 'path'

" nerdtree
let NERDTreeIgnore=['\.$', '\~$', '\.pyc$', '\.class$']
map <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerd commenter
let NERDShutUp=1
map <leader>m <leader>c<space>

" vim markdown
let g:vim_markdown_folding_disabled = 1

" tagbar
map <F4> :TagbarToggle<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
nmap <TAB> :bnext<CR>
nmap <S-TAB> :bprevious<CR>
set noshowmode
set laststatus=2

" strip-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

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
set clipboard+=unnamed

"Show matching bracets
set showmatch

"Get out of VI's compatible mode
set nocompatible

"Have the mouse enabled all the time
set mouse=a

"Set to auto read when a file is changed from the outside
set autoread

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
autocmd FileType python,java,ruby,go,robot setlocal tabstop=4 softtabstop=4 shiftwidth=4
"javascript/stylus/jade/html/ejs/tpl设置Tab宽度为2
autocmd FileType pug,jade,html,ejs,tpl,javascript,css,stylus setlocal tabstop=2 softtabstop=2 shiftwidth=2

"python，设置缩进格式
autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,expect,finally,def,class,with

"绑定自动补全的快捷键<C-X><C-O>到<leader>;
imap <leader>; <C-X><C-O>

"绑定复制到系统剪贴板快捷键
vmap <leader>c "+y
nmap <leader>c "+y

"绑定粘贴系统剪贴板内容快捷键
"imap <leader>v <ESC>"+p "不设置insert模式下的快捷键，因为会造成无法输入,v
vmap <leader>v <ESC>"+p
nmap <leader>v "+p

"复制粘贴
cmap <leader>" <C-r>"
cmap <leader>+ <C-r>+

"Ctrl+S
imap <C-s> <ESC>:w<CR>i
nmap <C-s> :w<CR>

"tag设置
autocmd FileType c,cpp,h,java,javascript,python,Makefile,Rakefile setlocal tags=.tags;
set autochdir

"for golang
function! SetGoPath()
    let srcDir = finddir('src', expand("%:p:h") . ';')
    if isdirectory(srcDir) && empty($GOPATH)
        let $GOPATH = fnamemodify(srcDir, ':h')
    endif
endfunction
autocmd FileType go call SetGoPath()
