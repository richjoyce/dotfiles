" Turn off vi compatibility
set nocompatible

"------Vundle Plugin Manager-----
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"" Solarized colors
Plugin 'altercation/vim-colors-solarized'
"" airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"" Whitespace highlighter
Plugin 'ntpeters/vim-better-whitespace'

"" Python pep8
Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on

"------Plugin Settings-----
set background=light
colorscheme solarized

"" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#loclist#enabled = 1
set noshowmode

"------General Settings-----
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

" Show bottom bar and count columns, etc
set ruler
set showcmd

" Incremental and highlight searching
set incsearch
set hlsearch

" Split the window on the right side
set splitright
set splitbelow

"------Key Bindings-----
" Toggle line numbers with \n
map <Leader>n :set number!<CR>
" Turn off highlighting (after a search)
map <Leader>h :noh<CR>
" Toggle paste mode with \p
map <Leader>p :set paste!<CR>
" Indent blocks multiple times
vnoremap < <gv
vnoremap > >gv

" Load vimrc in split
map <Leader>v :sp $MYVIMRC<CR>

" Re-Source vimrc on save
autocmd! bufwritepost .vimrc source %
