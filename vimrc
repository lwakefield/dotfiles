" First are the tool plugins
"   If there are options, they are define after the plugin is defined
" Then come the syntax plugins
" Next in line are the vanilla vim options
" Followed by mappings
" And finishing up with abbreviations
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/matchit'
Plugin 'airblade/vim-gitgutter'

" Below are plugins with config, in no particular order
Plugin 'scrooloose/syntastic'
let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

Plugin 'scrooloose/nerdtree'
let g:NERDCreateDefaultMappings=0

Plugin 'vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_extensions = ['branch', 'tabline']

Plugin 'ctrlpvim/ctrlp.vim'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_working_path_mode = 'a'

	let g:ctrlp_use_caching = 0
    let g:ctrlp_mruf_relative = 1
endif

Plugin 'easymotion/vim-easymotion'
nmap / <Plug>(easymotion-sn)
nmap ? <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_smartsign = 1

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <cr> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>""
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plugin 'rhysd/clever-f.vim'
let g:clever_f_timeout_ms = 2000

Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plugin 'mileszs/ack.vim'
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:ack_autoclose = 1
let g:ackpreview = 1

" Syntaxes
Plugin 'kchmck/vim-coffee-script'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'posva/vim-vue'
Plugin 'evidens/vim-twig'
Plugin 'pangloss/vim-javascript'
Plugin 'sekel/vim-vue-syntastic'

call vundle#end()
filetype plugin indent on

let mapleader = ","

" Colorscheme setup
let base16colorspace=256
colorscheme base16-flat
set background=dark
syntax enable
set relativenumber
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
set autoindent
" swap options
set noswapfile

" Mappings
" Prefer function keys for meta vim actions
noremap <F4> :e ~/.vimrc<CR>
noremap <F5> :so ~/.vimrc<CR>
noremap <F6> :PluginInstall<CR>
" Prefer Ctrl mappings for interface actions
noremap <C-Bslash> :NERDTreeToggle<CR>
noremap <C-f> :Ack 

" Use leader mappings here, because they are frequent and faster
nmap <leader>p :CtrlPMixed<CR>
nmap <leader>r :CtrlPBufTag<CR>

nmap <C-Up> <C-o>
nmap <C-Down> <C-i>

" Add control mappings, they are faster for multiple actions
nmap <C-Left> :bprev<CR>
nmap <C-Right> :bnext<CR>
nmap <C-q> :bd<CR>
nmap <leader>n :bprev<CR>
nmap <leader>m :bnext<CR>
nmap <leader>q :bd<CR>


silent! nunmap <leader>hp
silent! nunmap <leader>hr
silent! nunmap <leader>hs
nmap <leader>h :set hlsearch! hlsearch?<CR>
nmap <leader>v V$%
nmap <leader>% %%v%
nmap <leader>= V$%=
nmap <leader>a ggVG
vmap <leader>y :y*<CR>
map <leader>c <plug>NERDCommenterToggle<CR>

imap :w <Esc>:w<CR> 
nmap :W :w<CR>
map <leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

iabbrev lgo log
