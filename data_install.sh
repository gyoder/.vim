#!/bin/bash

wget -O $HOME/clangd.zip https://github.com/clangd/clangd/releases/download/19.1.2/clangd-linux-19.1.2.zip
unzip $HOME/clangd.zip -d $HOME/clangd
mv $HOME/clangd/clangd_19.1.2/* $HOME/clangd
rm -rf $HOME/clangd.zip

wget -O $HOME/nvim.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar -xvf $HOME/nvim.tar.gz -C $HOME
mv $HOME/nvim-linux-x86_64 $HOME/nvim
rm -rf $HOME/nvim.tar.gz

echo 'export PATH="$HOME/clangd/bin:$HOME/nvim/bin:$PATH"' >> $HOME/.bashrc
echo 'export CLANG_LIB_DIR="$HOME/clangd/lib"' >> $HOME/.bashrc

source $HOME/.bashrc

# ask if they would like to install the .vim folder

echo "Would you like to install the .vim folder from gyoder? (y/n)"
read install_vim
if [[ $install_vim == "y" ]]; then
    curl -s https://raw.githubusercontent.com/gyoder/.vim/master/install.sh | bash
fi


