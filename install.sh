#!/bin/bash

# Clone this repo
git clone https://github.com/gyoder/.vim.git $HOME/.vim

# Create a symlink to the .vimrc file and /.config/nvim 
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
# link the .config/nvim/ folder to .vim/nvim/
ln -s $HOME/.vim/nvim $HOME/.config/nvim

# Install vim-plug plugins
vim +PlugInstall +qall


