set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/flazz/vim-colorschemes.git'
Plugin 'chriskempson/base16-vim'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/scrooloose/syntastic/'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/SirVer/ultisnips'
Plugin 'https://github.com/honza/vim-snippets'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/tpope/vim-repeat'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/unblevable/quick-scope'
Plugin 'https://github.com/tmhedberg/matchit'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/mtth/scratch.vim'

" Syntaxes
Plugin 'https://github.com/StanAngeloff/php.vim'
Plugin 'https://github.com/shawncplus/phpcomplete.vim'
Plugin 'https://github.com/groenewege/vim-less'
Plugin 'https://github.com/othree/html5.vim'
Plugin 'https://github.com/derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on

let mapleader = ','

let base16colorspace=256
colorscheme base16-eighties
syntax enable
set background=dark


" Ctrlp config
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_working_path_mode = 'a'
	let g:ctrlp_use_caching = 0
    let g:ctrlp_mruf_relative = 1
endif

" Airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" YouCompleteMe config
" use <CR> to select an item from youcompleteme
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"NERDCommenter config
let g:NERDCreateDefaultMappings=0

"UltiSnips close preview on finish
autocmd CompleteDone * pclose
autocmd BufEnter,BufNew *.php UltiSnipsAddFiletypes php.html

"Syntastic config
"phpcs is slow?
let g:syntastic_php_checkers = ["php"]

" Mappings
nmap <leader>p :CtrlPMixed<CR>
nmap <leader>r :CtrlPBufTag<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>R :TagbarToggle<CR>
nmap <leader>n :bprev<CR>
nmap <leader>m :bnext<CR>
nmap <leader>q :bd<CR>
nmap <leader>h :set hlsearch! hlsearch?<CR>
nmap <Leader>s :%s/\<<C-r><C-w>\>/
map <leader>c <plug>NERDCommenterToggle<CR>
imap :w <Esc>:w<CR> 
nmap :W :w<CR>

set number
set mouse=a
set cursorline
set backspace=2
set hidden
" fold options
set foldmethod=indent
set foldlevelstart=20
" search options
set incsearch
set hlsearch
set ignorecase
set smartcase
" indent options
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
" swap options
set noswapfile
