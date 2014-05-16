set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

execute pathogen#infect()
syntax on
filetype plugin indent on

set rtp+=$POWERLINE_REPO/bindings/vim/
set laststatus=2

let g:Tex_DefaultTargetFormat='pdf'

set splitright
set splitbelow

nnoremap <leader>E :vsplit .<CR>7j

set background=light
colorscheme solarized
