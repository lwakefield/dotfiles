call plug#begin('~/.vim/plugged')
    Plug 'Raimondi/delimitMate'
    Plug 'SirVer/ultisnips'
    Plug 'airblade/vim-gitgutter'
    " Plug 'benekastah/neomake'
    Plug 'w0rp/ale'
    Plug 'arcticicestudio/nord-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'honza/vim-snippets'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jhawthorn/fzy'
    Plug 'srstevenson/vim-picker'
    Plug 'junegunn/vim-easy-align'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'tmhedberg/matchit' " % for html tags
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sleuth' " autoset indentation options
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-rsi'
    Plug 'spf13/vim-autoclose'
    Plug 'vim-scripts/YankRing.vim'
    Plug 'alvan/vim-closetag'
    Plug 'sheerun/vim-polyglot'
call plug#end()

set nocompatible
filetype off
set inccommand=split
set incsearch
set ignorecase
set smartcase
set wrap
set rnu
set nu
set listchars=tab:>-,trail:~
set list
set hlsearch
set spell
" set colorcolumn=81,101
filetype plugin indent on
set noerrorbells
set visualbell
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
set undofile
set undodir=~/.vim/undodir
" set clipboard=unnamed
let loaded_matchparen = 1

" Let's get this party started
let mapleader = " "
colorscheme nord
highlight OverLength ctermbg=0
2match OverLength /\%81v\|\%101v/
hi StatusLine ctermfg=1 ctermbg=None
hi LineNr ctermfg=DarkGray ctermbg=None
hi SignColumn ctermfg=1 ctermbg=None
set laststatus=2
" This toggles the status line detail level it is up here, because it does some
" initialization
let s:show_details = 0
function! ToggleHiddenAll()
    if s:show_details  == 0
        let s:show_details = 1
        set statusline=%=%F%m\ \ %p%%
    else
        let s:show_details = 0
        set statusline=%F%m%=[%L][%{&ff}]%y[%p%%][%04l,%04v]
    endif
endfunction
call ToggleHiddenAll()
nnoremap <leader>d :call ToggleHiddenAll()<CR>

" Plugin defaults
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif
let g:closetag_filenames = '*.html,*.jsx,*.cjsx'
let g:gitgutter_map_keys = 0
let g:gutentags_ctags_exclude = ['node_modules', 'dist_client', 'dist_server']
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
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger = "<c-@>"
let g:slime_no_mappings = 1
let g:slime_target = 'tmux'
let b:surround_99 = "/* \r */"

" autocmds
autocmd FileType vue UltiSnipsAddFiletypes javascript
" autocmd! BufWritePost,BufEnter * Neomake
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
highlight CursorOverWord ctermbg=8 ctermfg=White
autocmd CursorMoved * exe printf('match CursorOverWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Opinionated overrides
nnoremap Q <nop>
nnoremap H ^
nnoremap L $l
nnoremap j gj
nnoremap k gk
vnoremap H ^
vnoremap L $l
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
" the l stops cursor creep
inoremap <esc> <esc>l
vnoremap <esc> <esc>
nnoremap <esc> <esc>
inoremap <c-c> <esc>l
vnoremap <c-c> <esc>
nnoremap <c-c> <esc>
" Because I can't type for shit...
inoremap :w <Esc>:w<CR>
vnoremap :w <Esc>:w<CR>
nnoremap :W :w
" cnoremap wq w
" cnoremap qw w
" nnoremap q: :q
" plugins...
nmap <leader>c gcc
vmap <leader>c gc
nnoremap <leader>gi :Gbrowse<CR>
" nnoremap <leader>p :FilesMru --tiebreak=end<cr>
nnoremap <leader>p :PickerEdit<cr>
nnoremap <leader><leader> :PickerBuffer<cr>
nnoremap <leader><cr> :b#<cr>
nnoremap <leader>t :PickerBufferTag<cr>
nnoremap <leader>/ :Ag<Space>
nnoremap <leader>// :Ag<Space><C-r><C-w><CR>
" send the last command
nmap <leader>m :SlimeSend1 <c-v><c-p><c-v><cr><cr>
xmap <leader>l <Plug>(EasyAlign)
" buffer nav
" nnoremap <leader>w :bd<CR>
" nnoremap <leader>W :bd <c-a><CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>] :bnext<CR>
" utility belt
nnoremap <leader>rwl :s/<c-r><c-w>//g<left><left>
nnoremap <leader>rw :%s/<c-r><c-w>//g<left><left>
nnoremap <leader>rg :%s//g<left><left>
nnoremap <leader>rl :s//g<left><left>
vnoremap <leader>rw :s///g<left><left><left>
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
" commonly editted files
nnoremap <leader>edd :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>edt :e ~/.tmux.conf<CR>
nnoremap <leader>edz :e ~/.zshrc<CR>
nnoremap <leader>edp :e ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>et :e ~/notes/todo.md<CR>
nnoremap <leader>en :e ~/notes/notes.md<CR>
nnoremap <leader>go :!open "https://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q="<Left>
"
iabbrev lgo log
iabbrev #! #!/usr/bin/env

function! CdHist()
  let max  = histnr(':')
  let fmt  = ' %'.len(string(max)).'d '
  let list = filter(map(range(1, max), 'histget(":", - v:val)'), '!empty(v:val) && v:val =~ "^cd .*"')
  return map(list, 'matchlist(v:val, "^cd \\(.*\\)")[1]')
endfunction

inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
augroup autocomplete
    autocmd!
    autocmd TextChangedI * call TypeComplete()
augroup end
inoremap <expr> <cr> pumvisible() ? '<c-y><cr>' : '<cr>'
inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
inoremap <c-l> <c-e><c-x><c-l>
inoremap <c-o> <c-e><c-x><c-o>
fun! TypeComplete()
  " if getline('.')[col('.') - 2] =~ '\K' && getline('.')[col('.') - 1] !~ '\K'
  if !pumvisible() && getline('.')[col('.') - 2] =~ '\S'
    call feedkeys("\<c-n>")
  end
endfun
