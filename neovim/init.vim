call plug#begin('~/.vim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'carlitux/deoplete-ternjs'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'jhawthorn/fzy'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'sheerun/vim-polyglot'
    Plug 'spf13/vim-autoclose'
    Plug 'srstevenson/vim-picker'
    Plug 'tmhedberg/matchit' " % for html tags
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-rsi' " ADd support for readline shortcuts in cmdline
    Plug 'tpope/vim-sleuth' " SLOW autoset indentation options
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/YankRing.vim'
    Plug 'w0rp/ale'
    Plug 'zchee/deoplete-jedi'
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
set scrolloff=2
set t_Co=256
set autoread
set undofile
set undodir=~/.vim/undodir

let loaded_matchparen = 1

" Let's get this party started
let mapleader = " "

let tcolors = {
\    'black':         0,
\    'red':           1,
\    'green':         2,
\    'yellow':        3,
\    'blue':          4,
\    'magenta':       5,
\    'cyan':          6,
\    'grey':          7,
\    'brightblack':   8,
\    'brightred':     9,
\    'brightgreen':   10,
\    'brightyellow':  11,
\    'brightblue':    12,
\    'brightmagenta': 13,
\    'brightcyan':    14,
\    'brightgrey':    15
\}

function! s:hi(group, cterm, ctermfg, ctermbg)
    exe 'highlight ' . a:group
    \ . ' cterm='.a:cterm
    \ . ' ctermfg='.a:ctermfg
    \ . ' ctermbg='.a:ctermbg
endfunction

" Custom
call s:hi('OverLength',     'None',      tcolors.black,       tcolors.red)
2match OverLength /\%81v\|\%101v/
call s:hi('CursorOverWord', 'underline', tcolors.red,         'None')

" Syntax
call s:hi('Comment',        'None',      tcolors.brightblack, 'None')

call s:hi('String',         'None',      tcolors.green,       'None')
call s:hi('Constant',       'None',      tcolors.green,       'None')
call s:hi('Number',         'None',      tcolors.green,       'None')
call s:hi('Boolean',        'None',      tcolors.green,       'None')
call s:hi('Float',          'None',      tcolors.green,       'None')

call s:hi('Identifier', 'None',      tcolors.cyan,   'None')
call s:hi('Statement',  'None',      tcolors.blue,   'None')
call s:hi('PreProc',    'None',      tcolors.blue,   'None')
call s:hi('Type',       'None',      tcolors.blue,   'None')
call s:hi('Special',    'None',      'None',         'None')
call s:hi('Ignore',     'None',      tcolors.black,  'None')
call s:hi('Underlined', 'underline', 'None',         'None')
call s:hi('Error',      'underline', tcolors.red,    'None')
call s:hi('Todo',       'None',      tcolors.yellow, 'None')

" General Groups
call s:hi('StatusLine',     'None',      tcolors.red,         'None')
call s:hi('StatusLineNC',   'None',      tcolors.brightblack, 'None')
call s:hi('CursorLineNr',   'None',      tcolors.brightgrey,  'None')
call s:hi('LineNr',         'None',      tcolors.brightblack, 'None')
call s:hi('SignColumn',     'None',      'None',              'None')
call s:hi('VertSplit',      'None',      'None',              'None')
call s:hi('Visual',         'None',      tcolors.black,       tcolors.yellow)
call s:hi('SpellBad',       'underline', 'None',              'None')
call s:hi('SpellCap',       'None', 'None',              'None')
call s:hi('PMenu',          'None',      tcolors.black,       tcolors.brightblack)
call s:hi('Folded',         'None',      tcolors.brightblack,       'None')
" ColorColumn Conceal Cursor CursorColumn CursorIM CursorLine CursorLineNr
" DiffAdd DiffChange DiffDelete DiffText Directory EndOfBuffer ErrorMsg
" FoldColumn Folded Groups IncSearch LineNr MatchParen ModeMsg MoreMsg NonText
" Normal Pmenu PmenuSbar PmenuSel PmenuThumb Question QuickFixLine Search
" SignColumn SpecialKey SpellBad SpellCap SpellLocal SpellRare StatusLine
" StatusLineNC Substitute TabLine TabLineFill TabLineSel TermCursor
" TermCursorNC Title VertSplit Visual WarningMsg Whitespace WildMenu

set fillchars=""
set laststatus=2
" This toggles the status line detail level it is up here, because it does some
" initialization
let s:show_details = 0
function! ToggleHiddenAll()
    if s:show_details  == 0
        let s:show_details = 1
        set statusline=%=%F%m
    else
        let s:show_details = 0
        set statusline=%F%m%=[%L][%{&ff}]%y[%p%%][%04l,%04v]
    endif
endfunction
call ToggleHiddenAll()
nnoremap <leader>d :call ToggleHiddenAll()<CR>
set guicursor=n-v-c-sm:block/lCursor-blinkon1,i-ci-ve:ver25/lCursor-blinkon1,r-cr-o:hor20

" Plugin defaults
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif

let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_on_insert_enter = 0
let g:gitgutter_map_keys = 0
let g:gutentags_ctags_exclude = ['node_modules', 'dist_client', 'dist_server', 'coverage', 'build']
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
let b:surround_99 = "/* \r */"
let g:ale_fixers = {
  \'javascript': ['eslint'],
  \'python': ['yapf']
  \ }
let g:yankring_clipboard_monitor=0

" autocmds
autocmd FileType vue UltiSnipsAddFiletypes javascript
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

" Opinionated overrides
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
" the l stops cursor creep
inoremap <esc> <esc>l
vnoremap <esc> <esc>
nnoremap <esc> <esc>
" inoremap <c-c> <esc>l
" vnoremap <c-c> <esc>
" nnoremap <c-c> <esc>
" Because I can't type for shit...
inoremap :w <Esc>:w<CR>
vnoremap :w <Esc>:w<CR>
nnoremap :W :w
" plugins...
nmap <leader>c gcc
vmap <leader>c gc
" nnoremap <leader>p :FilesMru --tiebreak=end<cr>
nnoremap <leader>p :PickerEdit<cr>
nnoremap <leader><leader> :PickerBuffer<cr>
nnoremap <leader><cr> :b#<cr>
nnoremap <leader>t :PickerBufferTag<cr>
nnoremap <leader>/ :Ag<Space>
nnoremap <leader>// :Ag<Space><C-r><C-w><CR>
xmap <leader>l <Plug>(EasyAlign)
nnoremap <leader>ff :ALEFix<cr>
nnoremap <leader>ft :s/\s*$//g
vnoremap <leader>ft :s/\s*$//g
" window mappings
nnoremap <leader>ww <c-w>w
nnoremap <leader>wq <c-w>q
nnoremap <leader>wv :vsplit<cr>
nnoremap <leader>wh :hsplit<cr>
nnoremap <leader>wm <c-w><bar><cr><c-w>_<cr>
nnoremap <leader>we <c-w>=
" utility belt
nnoremap <leader>rwl :s/<c-r><c-w>//g<left><left>
nnoremap <leader>rr :%s/g<left>
nnoremap <leader>rw :%s/<c-r><c-w>//g<left><left>
nnoremap <leader>rg :%s//g<left><left>
nnoremap <leader>rl :s//g<left><left>
vnoremap <leader>rw :s///g<left><left><left>
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
nnoremap <leader>edf :e ~/.config/fish/config.fish<CR>
nnoremap <leader>edp :e ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>etn :e ~/todos/.md<left><left><left>
nnoremap <leader>ett :e ~/notes/todos.md<cr>
nnoremap <leader>etd :exe 'e ~/notes/' . strftime('%y-%m-%d') . '.md'<cr>
" Go somewhere...
nnoremap <leader>go :!open "https://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q="<Left>
nnoremap <leader>gi :Gbrowse<CR>

tnoremap <buffer> <Esc> <C-\><C-n>
tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
tnoremap <buffer> <C-l> <C-\><C-n><C-w>l

augroup markdown
    autocmd!
    autocmd FileType markdown nnoremap <buffer> <leader>fu yypVr=
    autocmd FileType markdown nnoremap <buffer> <leader>fh :s/^/#/<cr>
    autocmd FileType markdown nnoremap <buffer> <leader>fw vipgq
    autocmd FileType markdown set foldmethod=manual
    autocmd FileType markdown nnoremap <leader>it o- [ ] <c-r>=strftime('%y/%m/%d %H:%M')<cr> - 
augroup end

augroup nim
    autocmd FileType nim setlocal commentstring=#\ %s
augroup end

autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

cnoremap y<space>/ :normal qaq<cr> :g//y A<left><left><left><left>
cnoreabbrev bda bufdo bd
cnoreabbrev bd b # \| bd #
" cnoremap tvs :vs term cnoremap tsp :silent !tmux splitw -v "nvim %"

iabbrev #! #!/usr/bin/env
iabbrev ddate <c-r>=strftime('%y/%m/%d %H:%M')<cr>

" This highlights the current word
augroup hlword
    autocmd!
    autocmd CursorMoved * call HlWord()
augroup end
fun! HlWord()
  if getline('.')[col('.') - 1] =~ '\w'
    exe printf('match CursorOverWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))
  else
    exe 'match none'
  end
endfun

inoremap <expr> <cr> pumvisible() ? '<c-e><cr>' : '<cr>'
inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
inoremap <c-l> <c-e><c-x><c-l>
inoremap <c-o> <c-e><c-x><c-o>
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
