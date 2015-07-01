set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/chriskempson/base16-vim'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/scrooloose/syntastic/'
Plugin 'https://github.com/majutsushi/tagbar'

" The following are needed for snipmate
Plugin 'https://github.com/tomtom/tlib_vim'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plugin 'https://github.com/garbas/vim-snipmate'
Plugin 'https://github.com/honza/vim-snippets'

call vundle#end()
filetype plugin indent on

let mapleader = ','

colorscheme base16-default
let base16colorspace=256

" Ctrlp config
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

" NERDTreeConfig
nmap <leader>t :NERDTreeToggle<CR>

" Airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Tagbar config
nmap <leader>r :TagbarOpenAutoClose<CR>

set number
set cursorline
