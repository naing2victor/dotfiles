
---

# Prerequisites

Install `stow` and `neovim`

    sudo apt-get update && sudo apt-get install stow neovim -y

Remove dotfiles from home directory

    rm -rf .aliases .bashrc .config .profile .vim .vimrc autoload

# Clone into new machine

Clone including submodules

    git clone --recursive git@github.com:naing2victor/dotfiles.git

In case you forget to recursively clone, load submodules to cloned repository

    git submodule update --init --recursive

or

    git submodule init
    git pull --recurse-submodules

Check only without pulling into local directory

    git submodule init
    git fetch --recurse-submodule

Update submodules from remote with new commits

    git submodule update --remote --recursive

or

    git submodule foreach git pull origin master

## GNU Stow for soft links

    stow bash/ config/ vim/

---

# Add submodules for vim plugins

## Install vim pathogen

    mkdir -p ~/dotfiles/vim/.vim/autoload  ~/dotfiles/vim/.vim/bundle && \
    curl -LSso ~/dotfiles/vim/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Add vim plugins

    git submodule add git@github.com:morhetz/gruvbox.git ~/dotfiles/vim/.vim/bundle/gruvbox
    git submodule add git@github.com:dracula/vim.git ~/dotfiles/vim/.vim/bundle/dracula
    git submodule add git@github.com:vim-airline/vim-airline-themes.git ~/dotfiles/vim/.vim/bundle/vim-airline-themes
    git submodule add git@github.com:vim-airline/vim-airline.git ~/dotfiles/vim/.vim/bundle/vim-airline
    git submodule add git@github.com:preservim/nerdtree.git ~/dotfiles/vim/.vim/bundle/nerdtree
    git submodule add git@github.com:ctrlpvim/ctrlp.vim.git ~/dotfiles/vim/.vim/bundle/ctrlp
    git submodule add git@github.com:junegunn/fzf.git ~/dotfiles/vim/.vim/bundle/fzf
    git submodule add git@github.com:tpope/vim-fugitive.git ~/dotfiles/vim/.vim/bundle/vim-fugitive
    git submodule add git@github.com:easymotion/vim-easymotion.git ~/dotfiles/vim/.vim/bundle/vim-easymotion
    git submodule add git@github.com:sheerun/vim-polyglot.git ~/dotfiles/vim/.vim/bundle/vim-polyglot

# Working with git submodules for vim

## Installing a plugin as a submodule

    git submodule add http://github.com/[user]/[plugin] bundle/[plugin-name]
    git add .
    git commit -m "Update [plugin] [vimrc]"

## Update each plugin manually

    cd bundles/[plugin]
    git pull

## Removing a plugin

    git submodule deinit -f bundle/[plugin-name]
    rm -rf bundle/[plugin-name]
    git rm -rf bundle/[plugin-name]

## Pathogen with Submodules Guides

* https://gist.github.com/romainl/9970697
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
