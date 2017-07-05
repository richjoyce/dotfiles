" Turn off vi compatibility
set nocompatible

filetype plugin indent on

" Make backspace work as expected
set backspace=indent,eol,start
syntax on

" Fix tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Line numbers
set number
" Toggle line numbers with \n
map <Leader>n :set number!<CR>

" Show bottom bar and count columns, etc
set ruler
set showcmd

" Incremental and highlight searching
set incsearch
set hlsearch
map <Leader>h :noh<CR>

" Split the window on the right side
set splitright
set splitbelow

" Indent blocks multiple times
vnoremap < <gv
vnoremap > >gv

" Load vimrc in split
map <Leader>v :sp $MYVIMRC<CR>
" Re-Source vimrc on save
autocmd! bufwritepost .vimrc source %
