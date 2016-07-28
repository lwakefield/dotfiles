" Important
" ---------
set nocompatible
filetype off
set pastetoggle=<f12>

" Moving around, searching and patterns
" -------------------------------------
set incsearch
set ignorecase
set smartcase

" Displaying Text
" ---------------
set nowrap
set rnu
set nu
set listchars=tab:>-,trail:~
set list

" Syntax, highlighting and spelling
" ---------------------------------
set background=dark
syntax enable
set hlsearch
set spell
set cc=81
set cursorline
filetype plugin indent on

" Multiple windows
" ----------------
set laststatus=2
set hidden

" Using the mouse
" ---------------
set mouse=a

" Editing text
" ------------
set backspace=indent,eol,start
set completeopt=longest,menuone

" Tabs and indenting
" ------------------
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set shiftround

" Folding
" -------
set foldmethod=indent
set foldlevel=20

" The swap file
" -------------
set noswapfile

" Command line editing
" --------------------
set wildcharm=<c-z>

