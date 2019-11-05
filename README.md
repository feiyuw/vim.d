This repository contains five configuration files:

* vimrc
* neovim
* zshrc
* tmux.conf
* fzf-git.zsh

---

## VIM & Neovim

1. It works fine on Mac OSX with VIM 8.0+ and Neovim 0.3.7.
1. It should be OK for Linux with same version.

### Install & Upgrade

#### Pre-requirements

```sh
# fzf, bat, ripgrep, fd
brew install fzf
brew install bat
brew install ripgrep
brew install fd
```

#### Install

1. Clone `vim.d`

        git clone https://github.com/feiyuw/vim.d.git ~/workspace/vim.d

1. Create `~/.vimrc`

        ln -s ~/workspace/vim.d/vimrc ~/.vimrc  # vim
        mkdir -p ~/.config/nvim; ln -s ~/workspace/vim.d/nvim/init.vim ~/.config/nvim/init.vim  # neovim

1. Open `nvim`, execute `:PlugInstall`
1. Patch `powerline` font

    ```sh
    mkdir ~/.fonts
    git clone https://github.com/powerline/fonts.git ~/.fonts/powerline-fonts
    cd ~/.fonts/powerline-fonts
    ./install.sh
    ```
1. Install coc extensions like:

    ```sh
    :CocInstall coc-python 
    :CocInstall coc-tsserver 
    :CocInstall coc-json 
    ```
1. Open `nvim` again, enjoy!


#### Upgrade

1. Update vim.d

```bash
    cd ~/workspace/vim.d
    git pull
```

1. Open `nvim`, execute `:PlugClean`
1. Open `nvim`, execute `:PlugUpdate`


### Plugins

The plugins I used are:

* tomasr/molokai
* scrooloose/nerdtree
* vim-scripts/NERD_tree-Project
* scrooloose/nerdcommenter
* plasticboy/vim-markdown
* majutsushi/tagbar
* vim-airline/vim-airline
* vim-airline/vim-airline-themes
* tpope/vim-fugitive
* w0rp/ale
* feiyuw/robotframework-vim
* ntpeters/vim-better-whitespace
* elzr/vim-json
* pangloss/vim-javascript
* mxw/vim-jsx
* othree/html5.vim
* airblade/vim-gitgutter
* jiangmiao/auto-pairs
* ekalinin/Dockerfile.vim
* fatih/vim-go
* neoclide/coc.nvim
* christoomey/vim-tmux-navigator
* rust-lang/rust.vim
* roxma/nvim-yarp
* davidhalter/jedi-vim
* tpope/vim-sleuth
* /usr/local/opt/fzf
* junegunn/fzf.vim

### Shortcuts

1. `,e`

    open file

1. `,s`

    open file in split window

1. `,vs`

    open file in vertical split window

1. `,m`

    comment/uncomment code

1. `,f`

    open function list of current file, like `Ctrl-R` in sublime

1. `<F4>`

    open/close tag bar on the right panel

1. `<F12>`

    open/close project browser on the left panel

1. `<Ctrl-Tab>`

    in `normal` mode, switch files in minibuffer; in `insert` mode, used to select code snippet

1. `<Ctrl-p>`

    in `insert` mode, used to open specified file quickly

1. `<Ctrl-g>`

    in `insert` mode, used to search content of current project

1. `<Ctrl-e>`

    in `insert` mode, used to search content of buffers

1. `,c`

    copy to system clipboard

1. `,v`

    paste from system clipboard

## Some Tips

### Edit file in column

1. in `normal` mode, `<Ctrl-v>` start to select column, `<Shift-v>` to select multiple lines
1. after select several columns,
    * `I` used to add content before cursor column
    * `A` used to add content after cursor column
    * `r` used to modify content under cursor
    * `x` used to delete content under cursor

### Quick Move

1. `<Ctrl-o>` move to previous edit position
1. `<Ctrl-i>` move to forward edit position
1. `b` move to previous word, `w` move to next word
    * try `B` and `W`, and see what's the difference
1. `{` move to previous block, `}` move to next block
1. `0` move to start of the line, `$` move to end of the line
    * `^` move to first char of the line
1. `gg` move to the start of the file, `G` move to the end of the file
1. `<Ctrl-]>` jump to the definition of content under cursor, while `<Ctrl-t>` jump back

### Quick Edit

1. `u` undo, `<Ctrl-r>` redo
1. `.` report last step
1. `di'` delete content in `'`
1. `dt'` delete content from current position to `'`
1. `cw` modify the current word
1. `caw` modify the current word
1. `c0` modify from start to current position
1. `c$` modify from current position to end of this line
1. `R` update the content until got `ESC`

### Macro

1. `qa` start to record macro `a`
1. execute some steps
1. `q` stop to record
1. `@a` execute the macro
1. `@@` execute the last executed macro

### VIM on Terminal

1. Try tmux and zsh on iTerm2

## Tmux

```sh
ln -s ~/workspace/vim.d/tmux.conf ~/.tmux.conf
# clone tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# open tmux
tmux
# Execute <C-b>I
# wait until all plugins installed
# enjoy
```

## zsh

```sh
# install zsh
brew install zsh
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/workspace/vim.d/zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -s ~/workspace/vim.d/fzf-git.zsh ~/.oh-my-zsh/custom/fzf-git.zsh
```

Reopen terminal, and enjoy!

## Screenshot

[![asciicast](https://asciinema.org/a/Chzur3Ancy1ek5RimXuhS3GDK.svg)](https://asciinema.org/a/Chzur3Ancy1ek5RimXuhS3GDK)

## Reference

1. [Vim Awesome](https://vimawesome.com/)
1. [Vim Tips](http://www.rayninfo.co.uk/vimtips.html)
1. [Vim scripts](http://vim-scripts.org)
1. [Practical Vim](http://www.amazon.com/Practical-Vim-Thought-Pragmatic-Programmers/dp/1934356980/ref=sr_1_1?ie=UTF8&qid=1407823913&sr=8-1&keywords=practical+vim)
