call plug#begin('~/.vim/plugged')
    Plug 'Raimondi/delimitMate'
    Plug 'SirVer/ultisnips'
    Plug 'airblade/vim-gitgutter'
    Plug 'alvan/vim-closetag'
    Plug 'arcticicestudio/nord-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'honza/vim-snippets'
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
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-sleuth' " autoset indentation options
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/YankRing.vim'
    Plug 'w0rp/ale'
call plug#end()

set nocompatible
filetype off
set inccommand=split
set incsearch
set ignorecase
set smartcase
set wrap
set relativenumber
set number
set listchars=tab:>-,trail:~
set list
set hlsearch
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
colorscheme nord
highlight OverLength ctermbg=red
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
        set statusline=%=%F%m
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
let b:surround_99 = "/* \r */"

" autocmds
autocmd FileType vue UltiSnipsAddFiletypes javascript
" autocmd! BufWritePost,BufEnter * Neomake
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd FileType javascript.jsx,javascript nnoremap <buffer> <leader>f :!eslint --fix %<cr>

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
" nnoremap <leader>p :FilesMru --tiebreak=end<cr>
nnoremap <leader>p :PickerEdit<cr>
nnoremap <leader><leader> :PickerBuffer<cr>
nnoremap <leader><cr> :b#<cr>
nnoremap <leader>t :PickerBufferTag<cr>
nnoremap <leader>/ :Ag<Space>
nnoremap <leader>// :Ag<Space><C-r><C-w><CR>
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
nnoremap <leader>etn :e ~/todos/.md<left><left><left>
nnoremap <leader>ett :FZF ~/todos<CR>
" Go somewhere...
nnoremap <leader>go :!open "https://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q="<Left>
nnoremap <leader>gi :Gbrowse<CR>

cnoremap y<space>/ :normal qaq<cr> :g//y A<left><left><left><left>
cnoreabbrev bda bufdo bd

iabbrev lgo log
iabbrev #! #!/usr/bin/env

" Autocomplete!
augroup autocomplete
    autocmd!
    autocmd TextChangedI * call TypeComplete()
augroup end
inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
inoremap <expr> <cr> pumvisible() ? '<c-y><cr>' : '<cr>'
inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<tab>'
inoremap <c-l> <c-e><c-x><c-l>
inoremap <c-o> <c-e><c-x><c-o>
fun! TypeComplete()
  if !pumvisible() && getline('.')[col('.') - 2] =~ '\S'
    " call feedkeys("\<c-n>")
    call feedkeys("\<c-x>\<c-u>")
  end
endfun

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
highlight CursorOverWord ctermbg=8 ctermfg=White

fun! ComplWord(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\w'
            let start -= 1
        endwhile
        return start
    end
    let words = join(GetWordsInBuffer(bufnr('%')), '\\n')
    return split(system('echo '.words.' | fzy -e '.a:base))
endfun
fun! GetWordsInBuffer(buffer)
    let contents = readfile(bufname(a:buffer))
    let all_words = split(join(contents), '\W\+')
    let word_map = {}
    for word in all_words
        let word_map[word] = 1
    endfor
    return keys(word_map)
endfun
set completefunc=ComplWord
