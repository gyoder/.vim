" Basic vimrc if i ever need compatibility with normal vim

source ~/.vim/settings.vim


if version >= 703
    set undodir=~/.vim/backup/vimundo
    set undofile
    set undoreload=10000
endif
