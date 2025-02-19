set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set cursorcolumn

source ~/.vim/autoload/plug.vim
set clipboard=unnamedplus


" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=4
if g:hostname =~# 'cs.purdue.edu$'
    set tabstop=2
    set shiftwidth=2
    set cc=80
endif
" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

set exrc
set secure

set splitright

 " ctags optimization
 set autochdir
 set tags=tags;

if g:hostname =~# 'cs.purdue.edu$'
  let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'vim': ['vint'],
      \ 'cpp': ['clang'],
      \ 'c': ['clang', 'clangtidy']
  \}
  let g:ale_cpp_clangtidy_checks = ['-*', 'eastwood*']
  let g:ale_cpp_clangtidy_executable = 'clang-tidy'
  let g:ale_c_parse_compile_commands=1
  let g:ale_cpp_clangtidy_extra_options = '-- -I/homes/cs240/public/include/clang/include'
  let g:ale_cpp_clangtidy_options = ''
  let g:ale_set_balloons=1
  let g:ale_linters_explicit=1
  let g:airline#extensions#ale#enabled=1
endif
if !(g:hostname =~# 'cs.purdue.edu$')
  let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'vim': ['vint'],
      \ 'cpp': ['clang'],
      \ 'c': ['clang']
  \}
endif


set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'lifepillar/vim-solarized8'
    Plug 'sainnhe/everforest'
    Plug 'craigemery/vim-autotag'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='base16_solarized_dark'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'f-person/git-blame.nvim'
    Plug 'Yggdroot/indentLine'
    Plug 'deoplete-plugins/deoplete-clang'
    Plug 'Shougo/deoplete.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'emilienlemaire/clang-tidy.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'Raimondi/delimitMate'
    if !(g:hostname =~# 'cs.purdue.edu$')
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'github/copilot'
        Plug 'wfxr/minimap.vim'
        let g:minimap_width = 10
        let g:minimap_auto_start = 1
        let g:minimap_highlight_search = 1
        let g:minimap_git_colors = 1
    endif

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

    let mapleader = "\\"

    nnoremap <leader>\ :nohlsearch<CR>

    inoremap jj <esc>

    nnoremap <C-b> :NERDTreeToggle<CR>

    inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

    map <leader>g :GFiles<CR>
    map <leader>f :Files<CR>
    map <leader>t :Tags<CR>
    nnoremap <silent> <leader>r :lua vim.lsp.buf.rename()<CR>
    func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
    endfunc
    noremap <leader>w :call DeleteTrailingWS()<CR>


" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_auto_popup = 0
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}



colorscheme solarized8
