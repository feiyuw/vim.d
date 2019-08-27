let g:mapleader=","

syntax on

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/NERD_tree-Project'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'feiyuw/robotframework-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sleuth'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

"fzf
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4.. --preview-window=hidden'}, <bang>0)
let g:fzf_files_options =
\ '--bind up:preview-up,down:preview-down --preview "(bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500"'
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
nmap <C-g> :Rg<CR>

"coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
nmap <C-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"rust.vim
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

"vim-go
let g:go_version_warning = 1
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" tmux
let g:tmux_navigator_save_on_switch = 1

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

" molokai
set background=dark
set t_Co=256
let g:rehash256 = 1
colorscheme molokai

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/proto/*,*/dist/*,*/.cache/*,*/bower_components/*.tags,__pycache__,*.pyc,*.class

" nerdtree
let NERDTreeIgnore=['\.$', '\~$', '\.pyc$', '\.class$']
map <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" persistent undo
set undofile

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
let g:airline#extensions#coc#enabled = 1
nmap <TAB> :bnext<CR>
nmap <S-TAB> :bprevious<CR>
set noshowmode
set laststatus=2

" strip-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

filetype plugin indent on

set number
set ruler
set cursorline
"set cursorcolumn
set cc=120
set fileencodings=utf-8,gb18030,cp936,big5,utf-16le
set list
set listchars=tab:>-,trail:-
set hlsearch
set incsearch
set autoindent
set smartindent
set hidden
set linebreak
set tabstop=4
set softtabstop=4
set smarttab

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

"自动格式化
set formatoptions=tcrqn

"在normal模式下使用系统剪贴板
set clipboard+=unnamed

"Show matching bracets
set showmatch

"Get out of VI's compatible mode
set nocompatible

"Enable magic mode
set magic

"Have the mouse enabled all the time
set mouse=a

"Set to auto read when a file is changed from the outside
set autoread

"打开目录时不显示隐藏目录和文件
let g:netrw_hide= 1
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'

"python，设置缩进格式
autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,expect,finally,def,class,with

let g:python3_host_prog = '/usr/local/bin/python3'

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

"for golang
function! SetGoPath()
    let srcDir = fnamemodify(finddir('src', expand("%:p:h") . ';'), ':p:h')
    if isdirectory(srcDir) && empty($GOPATH)
        let $GOPATH = fnamemodify(srcDir, ':h')
    endif
endfunction
autocmd FileType go call SetGoPath()
