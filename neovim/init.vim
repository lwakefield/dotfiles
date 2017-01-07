set nocompatible
filetype off
set pastetoggle=<f12>
set inccommand=split
set incsearch
set ignorecase
set smartcase
set wrap
set rnu
set nu
set listchars=tab:>-,trail:~
set list
set background=dark
syntax enable
set hlsearch
set spell
set colorcolumn=81,101
set cursorline
filetype plugin indent on
set laststatus=2
" lets you change buffers w/o a write
set hidden
set mouse=a
set backspace=indent,eol,start
set completeopt=longest,menu,menuone,noinsert,noselect
set complete=.,w,b,u,t
set shortmess+=c
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
" round indentation to multiple of shiftwidth
set shiftround
set foldmethod=indent
set foldlevel=20
set noswapfile
set wildcharm=<c-z>
set scrolloff=2
set t_Co=256
set autoread
set statusline=%F%=[%L][%{&ff}]%y[%p%%][%04l,%04v]
set undofile
set undodir=~/.vim/undodir

call plug#begin('~/.vim/plugged')
    Plug 'Raimondi/delimitMate'
    Plug 'SirVer/ultisnips'
    Plug 'airblade/vim-gitgutter'
    Plug 'benekastah/neomake'
    Plug 'brooth/far.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'haya14busa/incsearch.vim'
    Plug 'honza/vim-snippets'
    Plug 'jpalardy/vim-slime'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'tmhedberg/matchit' " % for html tags
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sleuth' " autoset indentation options
    Plug 'tpope/vim-surround'
    Plug 'tweekmonster/fzf-filemru'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/YankRing.vim'

    " Syntaxes
    Plug 'StanAngeloff/php.vim'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'derekwyatt/vim-scala'
    Plug 'evidens/vim-twig'
    Plug 'fatih/vim-go'
    Plug 'flowtype/vim-flow'
    Plug 'godlygeek/tabular'
    Plug 'groenewege/vim-less'
    Plug 'kchmck/vim-coffee-script'
    Plug 'lepture/vim-jinja'
    Plug 'mxw/vim-jsx'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    let g:javascript_enable_domhtmlcss=1
    Plug 'plasticboy/vim-markdown'
    Plug 'posva/vim-vue'
    Plug 'sekel/vim-vue-syntastic'
    Plug 'shawncplus/phpcomplete.vim'

call plug#end()

" Let's get this party started
let mapleader = " "
let base16colorspace=256
colorscheme base16-harmonic16-dark

" Plugin defaults
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#tabline#show_tabs = 0
" let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:gitgutter_map_keys = 0
let g:gutentags_exclude = ['node_modules', 'dist_client', 'dist_server']
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['file', 'omni', 'keyn', 'c-n', 'dict']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_scss_stylelint_maker = {
            \ 'exe': 'stylelint',
            \ 'args': ['--syntax', 'scss'],
            \ 'errorformat': '\ %l:%c\ %*[\✖]\ %m'
            \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_vue_eslint_maker = {
            \ 'args': ['--plugin', 'html', '-f', 'compact'],
            \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
            \ '%W%f: line %l\, col %c\, Warning - %m'
            \ }
let g:neomake_vue_enabled_makers = ['eslint']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = "<c-@>"
let g:slime_no_mappings = 1
let g:slime_target = 'tmux'
let b:surround_99 = "/* \r */"

" autocmds
autocmd FileType vue UltiSnipsAddFiletypes javascript
autocmd! BufWritePost,BufEnter * Neomake
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
" autocmd! bufwritepost ~/.config/nvim/init.vim call AirlineRefresh()

" Opinionated overrides
nnoremap Q <nop>
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
" until i get used to <c-c>...
inoremap <esc> <nop>
vnoremap <esc> <nop>
nnoremap <esc> <nop>
" the l stops cursor creep
inoremap <c-c> <esc>l
vnoremap <c-c> <esc>
nnoremap <c-c> <esc>
" Because I can't type for shit...
inoremap :w <Esc>:w<CR>
vnoremap :w <Esc>:w<CR>
nnoremap :W :w
cnoremap wq w
cnoremap qw w
nnoremap q: :q
" plugins...
nmap <leader>c gcc
vmap <leader>c gc
nnoremap <leader>g :Gbrowse<CR>
nnoremap <leader>p :FilesMru --tiebreak=end<cr>
" nnoremap <leader>p :call fzf#vim#files('.', {'options': '--reverse'})<CR>
nnoremap <leader><leader> :call fzf#vim#buffers({'options': '--reverse'})<CR>
nnoremap <leader>r :call fzf#vim#buffer_tags('', {'options': '--reverse'})<CR>
nnoremap <leader>o :call fzf#run({'source': CdHist(), 'sink': 'cd', 'down': '40%'})<cr>
nnoremap <leader>f :Ag<Space>
nnoremap <leader>F :Ag<Space><C-r><C-w><CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" send the last command
nmap <leader>m :SlimeSend1 <c-v><c-p><c-v><cr><cr>
xmap <leader>l <Plug>(EasyAlign)
" buffer nav
" nnoremap <leader>w :bd<CR>
" nnoremap <leader>W :bd <c-a><CR>
nnoremap <leader>!w :bd!<CR>
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>] :bnext<CR>
" utility belt
nnoremap <leader>b :%s/<c-r><c-w>//g<left><left>
vnoremap <leader>b :s/<c-r><c-w>//g<left><left>
nnoremap <leader>n :set hlsearch<cr>#*cgn
vnoremap <leader>n <esc>:set hlsearch<cr>gvy/<C-R>"<CR>Ncgn
nnoremap <leader>v :normal! v/[\(\){}\[\]]<CR>%
nnoremap <leader>V :normal! V$?[\(\){}\[\]]<CR>%
vnoremap <leader>v :normal! v/[\(\){}\[\]]<CR>%
vnoremap <leader>V :normal! V$?[\(\){}\[\]]<CR>%
nnoremap <leader>a ggVG
vnoremap <leader>y :y*<CR>
nnoremap <leader>z :set foldlevel=
nnoremap <leader>h :set hlsearch! hlsearch?<CR>
nnoremap <leader>s :set hlsearch<CR> #*
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" commonly editted files
nnoremap <leader>edd :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>edz :e ~/.zshrc<CR>
nnoremap <leader>edp :e ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>et :e ~/notes/todo.md<CR>
nnoremap <leader>en :e ~/notes/notes.md<CR>

iabbrev lgo log
iabbrev #! #!/usr/bin/env

function! CdHist()
  let max  = histnr(':')
  let fmt  = ' %'.len(string(max)).'d '
  let list = filter(map(range(1, max), 'histget(":", - v:val)'), '!empty(v:val) && v:val =~ "^cd .*"')
  return map(list, 'matchlist(v:val, "^cd \\(.*\\)")[1]')
endfunction

augroup autocomplete
    autocmd!
    autocmd TextChangedI * call TypeComplete()
augroup end
inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
fun! TypeComplete()
  if getline('.')[col('.') - 2] =~ '\K' && getline('.')[col('.') - 1] !~ '\K'
    call feedkeys("\<c-n>")
  end
endfun
