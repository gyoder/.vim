#!/bin/bash

# Clone this repo
git clone https://github.com/gyoder/.vim.git $HOME/.vim

# Create a symlink to the .vimrc file and /.config/nvim 
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
ln -s $HOME/.vim/nvim $HOME/.config/nvim

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Packages
nvim +PackerSync +qa
