"" Setup vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"" Vundle plugins
"" fugitive the best vim git wrapper
Plugin 'tpope/vim-fugitive'
"" dispatch compilers
Plugin 'tpope/vim-dispatch'
"" Latex-Suite
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex.git'
"" Better markdown support
Plugin 'plasticboy/vim-markdown'
"" Render markdown
Plugin 'greyblake/vim-preview'
"" PEP8 checker
Plugin 'nvie/vim-flake8'
"" The best vim autocompleter
Plugin 'Valloric/YouCompleteMe'
"" Add a git diff tracker in the gutter
Plugin 'airblade/vim-gitgutter'
"" Unbleed my eyes
Plugin 'altercation/vim-colors-solarized'
"" CMake builder-ma-bobber
Plugin 'vhdirk/vim-cmake'
"" CMake Project tree
"Plugin 'Ignotus/vim-cmake-project'
"" CMake project support
"Plugin 'jalcine/cmake.vim'
"" airline status bar
Plugin 'bling/vim-airline'
"" syntastic syntax checker
Plugin 'scrooloose/syntastic'
"" NERDtree
Plugin 'scrooloose/nerdtree'
"" Tagbar shows you what function you're in
Plugin 'majutsushi/tagbar'
"" Show me my indent plz
Plugin 'nathanaelkane/vim-indent-guides'
"" Make tmux the same theme bar as airline
" This was nice to start off my tmux config,
" but now I've customized it on top of it
"Plugin 'edkolev/tmuxline.vim'
"" Alternate to header and v-v
Plugin 'a.vim'
call vundle#end()
filetype plugin indent on

"" Of course
syntax on

"" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized2'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set noshowmode

"" Highlight extra whitespace as RED
"" (Must be done before colorscheme)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" TODO these aren't always working...
au InsertLeave * match ExtraWhitespace /\s\+$/
au InsertLeave * match ExtraWhitespace /\t/

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

"" Replace tabs with spaces when encountering code from evil people
" This is kinda like performing an exorcism
command! ReplaceTabs %s/\t/    /eg
" Forgive me father, for I have sinned.
command! RemoveTrailing %s/\s\+$//e
command! FixWhitespace exec "ReplaceTabs" | exec "RemoveTrailing" | noh
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

"" Toggle tagbar
noremap <leader>t :TagbarToggle<CR>

"" Re-Source vimrc on save
autocmd! bufwritepost .vimrc source %

"" Indent blocks multiple times
vnoremap < <gv
vnoremap > >gv

" resize a la tmux
nnoremap j <C-w>-
nnoremap k <C-w>+
nnoremap h <C-w><
nnoremap l <C-w>>

" move between tabs
nnoremap tj  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap tn  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tp  :tabprev<CR>
nnoremap tk  :tablast<CR>
nnoremap te  :tabedit<Space>
nnoremap tc  :tabnew<CR>:Ex<CR>
nnoremap tm  :tabm<Space>
nnoremap t>  :tabm +1<CR>
nnoremap t<  :tabm -1<CR>
nnoremap td  :tabclose<CR>

"" Sign column color
highlight SignColumn ctermbg=lightgrey
"" Add line numbers
set nu

"" YouCompleteMe config
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_enable_diagnostic_signs = 0

"" CMake and make shortcuts
nnoremap <leader>C :CMake<CR>
nnoremap <leader>B :make<CR>
nnoremap <leader>I :make install<CR>

"" Open header file
nnoremap <F2> :A<CR>
nnoremap <leader><F2> :AV<CR>
"" Open header under cursor
nnoremap <F3> :IH<CR>
nnoremap <leader><F3> :IHV<CR>

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=7
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
