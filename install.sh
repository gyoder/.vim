#!/bin/bash

# Check if .vim and .config/nvim directories exist
# if they do ask the user if they want to delete them
# if they dont exit

if [ -d $HOME/.vim ] || [ -d $HOME/.config/nvim ]; then
    read -p "Do you want to delete the existing .vim and .config/nvim directories? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf $HOME/.vim
        rm -rf $HOME/.config/nvim
    else
        exit 1
    fi
fi

# Clone this repo
git clone git@github.com:gyoder/.vim.git $HOME/.vim

# Create a symlink to the .vimrc file and /.config/nvim 
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
ln -s $HOME/.vim/nvim $HOME/.config/nvim

# Install vim-plug plugins
vim +PlugInstall +qall

# make a very clear message to run nvim and that install is complete

echo "Install complete."
echo "Please run `nvim` to use this install"
