call plug#begin('~/.vim/plugged')
     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     
     Plug 'airblade/vim-gitgutter'
     Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
     Plug 'junegunn/fzf.vim'
     Plug 'junegunn/vim-easy-align'
     Plug 'michaeljsmith/vim-indent-object'
     Plug 'sheerun/vim-polyglot'

     Plug 'tpope/vim-commentary'
     Plug 'tpope/vim-rsi' " Add support for readline shortcuts in cmdline
     Plug 'tpope/vim-sleuth' " SLOW autoset indentation options
     Plug 'tpope/vim-surround'
     Plug 'vim-scripts/YankRing.vim'
call plug#end()

set nocompatible
set inccommand=nosplit
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set relativenumber
set number
set listchars=tab:>-,trail:~
set list
set spell
filetype plugin indent on
set noerrorbells
set visualbell
set hidden
set mouse=a
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set complete=.,w,b,u
set shortmess+=c
set expandtab
set autoindent
set shiftround
set foldmethod=indent
set foldlevel=20
set noswapfile
set scrolloff=2
set autoread
set undofile
set undodir=~/.vim/undodir
set splitbelow
set splitright
set fillchars=""
set laststatus=2

" Let's get this party started
let mapleader = " "

colorscheme mine

" Plugin defaults
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg -l ""'
endif


let g:gitgutter_map_keys = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:yankring_clipboard_monitor=0
let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.5 } }

" autocmds
autocmd FileType vue UltiSnipsAddFiletypes javascript
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd VimResized * wincmd =

augroup improved-search
    autocmd!
    autocmd CmdlineEnter /,\? :cnoremap <tab> <c-g>
    autocmd CmdlineLeave /,\? :cunmap <tab>

    autocmd CmdlineEnter /,\? :cnoremap <s-tab> <c-t>
    autocmd CmdlineLeave /,\? :cunmap <s-tab>

    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

nnoremap Q <nop>
nnoremap H ^
nnoremap L $l
nnoremap j gj
nnoremap k gk
vnoremap H ^
vnoremap L $l
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
inoremap <esc> <esc>l
vnoremap <esc> <esc>
nnoremap <esc> <esc>

nmap <leader>c gcc
vmap <leader>c gc
nnoremap <leader><cr> :b#<cr>
nnoremap <leader>/ :Rg<cr>
nnoremap <leader>// :Rg<Space><C-r><C-w><CR>
xmap <leader>l <Plug>(EasyAlign)

nnoremap <leader>rr :%s/g<left>
nnoremap <leader>rw :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>
nnoremap <leader>a ggVG
vnoremap <leader>y :y*<CR>
" commonly editted files
nnoremap <leader>edd :e ~/.config/nvim/init.vim<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>

command! Ga !git add %

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
imap <c-k> <Plug>(coc-snippets-expand)
