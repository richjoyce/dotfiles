"" Setup vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"" Vundle plugins
"" fugitive the best vim git wrapper
Plugin 'tpope/vim-fugitive'
"" Latex-Suite
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex.git'
"" Better markdown support
Plugin 'plasticboy/vim-markdown'
"" Render markdown
Plugin 'greyblake/vim-preview'
"" PEP8 checker
Plugin 'nvie/vim-flake8'
"" The best autocompleter in existence
Plugin 'Valloric/YouCompleteMe'
"" Add a git diff tracker in the gutter
Plugin 'airblade/vim-gitgutter'
"" Unbleed my eyes
Plugin 'altercation/vim-colors-solarized'
"" CMake builder-ma-bobber
Plugin 'vhdirk/vim-cmake'
"" CMake Project tree
"Plugin 'Ignotus/vim-cmake-project'
"" airline status bar
Plugin 'bling/vim-airline'
"" syntastic syntax checker
Plugin 'scrooloose/syntastic'
"" Tagbar shows you what function you're in
Plugin 'majutsushi/tagbar'
"" Make tmux the same theme bar as airline
Plugin 'edkolev/tmuxline.vim'
call vundle#end()
filetype plugin indent on

"" Of course
syntax on

"" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1

"" Latex-Suite compile as pdf
let g:Tex_DefaultTargetFormat='pdf'

"" Split the window on the right side
set splitright
set splitbelow

"" Split and move to .. in Explore
nnoremap <leader>E :vsplit .<CR>7j

"" Set colorscheme
set background=light
colorscheme solarized

"" All sane people use 4 spaces as indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"" Toggle tagbar
noremap <leader>t :TagbarToggle<CR>
