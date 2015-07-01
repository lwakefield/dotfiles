set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/morhetz/gruvbox'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/scrooloose/syntastic/'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/StanAngeloff/php.vim'

" The following are needed for snipmate
Plugin 'https://github.com/tomtom/tlib_vim'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plugin 'https://github.com/garbas/vim-snipmate'
Plugin 'https://github.com/honza/vim-snippets'

call vundle#end()
filetype plugin indent on

let mapleader = ','

colorscheme gruvbox
syntax enable
set background=dark

" Ctrlp config
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

" Airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Mappings
nmap <leader>p :CtrlP<CR>
nmap <leader>r :CtrlPBufTag<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>R :TagbarToggle<CR>
nmap <leader>n :bprev<CR>
nmap <leader>m :bnext<CR>
nmap <leader>q :bd<CR>

set number
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
