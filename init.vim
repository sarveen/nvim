call plug#begin(stdpath('data'))

Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

call plug#end()

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set fileformat=unix

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

set encoding=UTF-8

syntax on

let g:airline_powerline_fonts = 1
let g:airline_theme = 'purify'

set nu rnu

set clipboard=unnamed

nnoremap // :noh<return>
autocmd filetype cpp nnoremap <F12> :w <CR> : !python ../submit.py % <CR>
autocmd filetype cpp nnoremap <F9> :w <CR> : !make %:t:r <CR>
