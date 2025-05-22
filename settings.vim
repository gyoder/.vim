filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set cursorcolumn
set clipboard=unnamedplus
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set cc=120
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set splitright

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif
