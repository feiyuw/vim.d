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
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'feiyuw/robotframework-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi', { 'for': 'python' }
Plug 'ncm2/ncm2-go', { 'for': 'go' }
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'tpope/vim-sleuth'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

"fzf
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4.. --preview-window=hidden'}, <bang>0)
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
nmap <C-g> :Rg<CR>

"ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"jedi-vim
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<C-]>"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_enabled = 0

"rust.vim
let g:ale_rust_rustc_options = ''
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
"vim-go
let g:go_version_warning = 1

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

" ale
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8'], 'rust': ['cargo'], 'go': ['gometalinter']}
let g:ale_maximum_file_size = 524288  " 512KB
let g:ale_completion_enabled = 0
let g:ale_lint_delay = 250
"let g:ale_lint_on_text_changed = "normal"
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" molokai
set background=dark
set guioptions=i
set guifont=Source\ Code\ Pro\ for\ Powerline\ Book\ 12
set guifontwide=Source\ Code\ Pro\ for\ Powerline\ Book\ 12
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
" 在窗口间移动
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l

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

"打开目录时不显示隐藏目录和文件，以及.pyc文件。
let g:netrw_hide= 1
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'

"AutoCommand
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"python，设置缩进格式
autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,expect,finally,def,class,with

let g:python3_host_prog = '/usr/local/bin/python3'

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

"for golang
function! SetGoPath()
    let srcDir = fnamemodify(finddir('src', expand("%:p:h") . ';'), ':p:h')
    if isdirectory(srcDir) && empty($GOPATH)
        let $GOPATH = fnamemodify(srcDir, ':h')
    endif
endfunction
autocmd FileType go call SetGoPath()
