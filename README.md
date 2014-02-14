My VIM configuration
======================

1. It works fine on 64bit Lubuntu with VIM 7.4.
1. It should be OK for other Linux and VIM 7.+.

Installation
===========
1. Install `vundle`
    `git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
1. Clone `vim.d`
    `git clone https://github.com/feiyuw/vim.d.git ~/Workspace/vim.d`
1. Create `~/.vimrc`
    `ln -s ~/Workspace/vim.d/vimrc ~/.vimrc`
1. Open `gvim`, execute `:BundleInstall`
1. Open `gvim` again, enjoy!

Plugins
==========
* `gmarik/vundle`                   -> vim scripts manager
* `Solarized`                       -> color schema
* `ctrlp.vim`                       -> similar with sublime `Ctrl+P`
* `taglist.vim`                     -> show outline of code
* `minibufexpl.vim`                 -> buffer list on the top panel
* `The-NERD-tree`                   -> project like file browser
* `NERD_tree-Project`               -> auto determine project root path
* `The-NERD-Commenter`              -> comment/uncomment your code easilly
* `pyflakes.vim`                    -> pyflakes support for python file
* `UltiSnips`                       -> code snipper support
* `carlobaldassi/ConqueTerm`        -> execute command on vim panel
* `Markdown`                        -> markdown syntax support

Shortcuts
=============
1. `,e`                 -> open files
1. `<Ctrl-m>`           -> comment/uncomment code
1. `<F4>`               -> open tag list on the right panel
1. `<F12>`              -> open project browser on the left panel
1. `<F10>`              -> open bash on the below panel
1. `<Ctrl-Tab>`         -> in `normal` mode, switch files in minibuffer; in `insert` mode, used to select code snippet
1. `<Ctrl-p>`           -> in `insert` mode, used to open specified file quickly
1. `,;`                 -> auto complete
1. `,t`                 -> open new tab
1. `,n`                 -> go to next tab

Reference
=============
1. [VIM Tips](http://www.rayninfo.co.uk/vimtips.html)
1. [VIM scripts](http://vim-scripts.org)
