" First are the tool plugins
"   If there are options, they are define after the plugin is defined
" Then come the syntax plugins
" Next in line are the vanilla vim options
" Followed by mappings
" And finishing up with abbreviations
"
" Sorted into:
" 1. Defaults
" 2. Plugins and their settings
" 3. Mappings
"
" Where relevant, they are sorted by:
" 1.  important
" 2.  moving around, searching and patterns
" 3.  tags
" 4.  displaying text
" 5.  syntax, highlighting and spelling
" 6.  multiple windows
" 7.  multiple tab pages
" 8.  terminal
" 9.  using the mouse
" 10. printing
" 11. messages and info
" 12. selecting text
" 13. editing text
" 14. tabs and indenting
" 15. folding
" 16. diff mode
" 17. mapping
" 18. reading and writing files
" 19. the swap file
" 20. command line editing
" 21. executing external commands
" 22. running make and jumping to errors
" 23. language specific
" 24. multi-byte characters
" 25. various

set runtimepath+=~/.config/nvim/
let mapleader = " "

runtime defaults.vim
runtime plugins.vim

set scrolloff=2
set t_Co=256
let base16colorspace=256
colorscheme base16-harmonic16-dark

set autoread
let g:netrw_liststyle=3
let g:netrw_banner=0

" Prefer control mappings for multiple actions
" Otherwise <leader>KEY is faster
" Prefer function keys for meta vim actions
noremap <leader>edd :e ~/.config/nvim/init.vim<CR>
noremap <leader>edz :e ~/.zshrc<CR>
noremap <leader>edp :e ~/.config/nvim/plugins.vim<CR>
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd! bufwritepost ~/.config/nvim/defaults.vim source ~/.config/nvim/init.vim
autocmd! bufwritepost ~/.config/nvim/plugins.vim source ~/.config/nvim/init.vim

" Plugins
nmap <leader>c <plug>NERDCommenterToggle<CR>
vmap <leader>c <plug>NERDCommenterToggle<CR>
nmap <leader>p :Files<CR>
nmap <leader>P :History<CR>
nmap <leader>r :BTags<CR>
if exists("neovim_dot_app")
    call MacMenu("File.Print", "")
    nmap <D-p> :Files<CR>
    nmap <D-r> :BTags<CR>
    nmap <D-S-p> :History<CR>
    nmap <D-/> <plug>NERDCommenterToggle<CR>
    vmap <D-/> <plug>NERDCommenterToggle<CR>
endif

" Autocomplete mappings

imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
if exists("neovim_dot_app")
    nmap <D-1> <Plug>AirlineSelectTab1
    nmap <D-2> <Plug>AirlineSelectTab2
    nmap <D-3> <Plug>AirlineSelectTab3
    nmap <D-4> <Plug>AirlineSelectTab4
    nmap <D-5> <Plug>AirlineSelectTab5
    nmap <D-6> <Plug>AirlineSelectTab6
    nmap <D-7> <Plug>AirlineSelectTab7
    nmap <D-8> <Plug>AirlineSelectTab8
    nmap <D-9> <Plug>AirlineSelectTab9
endif

" Add control mappings, they are faster for multiple actions
nmap <leader>[ :bprev<CR>
nmap <leader>] :bnext<CR>
nmap <leader><leader> <C-^>
nmap <leader>w :bd<CR>
nmap <leader>W :bd <c-a><CR>
nmap <leader>!w :bd!<CR>
if exists("neovim_dot_app")
    nmap <D-Left> :bprev<CR>
    nmap <D-Right> :bnext<CR>
    nmap <D-[> :bprev<CR>
    nmap <D-]> :bnext<CR>
    call MacMenu("Window.Close Tab", "")
    call MacMenu("Window.Close Other Tabs", "")
    nnoremap <D-w> :bd<CR>
    nnoremap <D-S-w> :bd!<CR>
    tnoremap <D-S-w> <C-\><C-n>:bd!<CR>
endif

nmap <leader>h :set hlsearch! hlsearch?<CR>
nmap <leader>v :normal! v/[\(\){}\[\]]<CR>%
nmap <leader>V :normal! V$?[\(\){}\[\]]<CR>%
nmap <leader>a ggVG
vmap <leader>y :y*<CR>
nmap <leader>d yyp
nmap <leader>et :e ~/notes/todo.md<CR>
nmap <leader>en :e ~/notes/notes.md<CR>
nmap <leader>z :set foldlevel=

" Overrides
nmap Q <nop>
nmap H ^
nmap L $
vmap H ^
vmap L $
nmap <tab> >>
nmap <s-tab> <<
vmap <tab> >gv
vmap <s-tab> <gv
nnoremap ci( /(<CR>ci(
nnoremap ci{ /{<CR>ci{

nnoremap <C-D-Up> ddkP
nnoremap <C-D-Down> ddjP
vnoremap <C-D-Up> dkP`[V`]
vnoremap <C-D-Down> djP`[V`]

imap :w <Esc>:w<CR>
inoremap <Esc> <Esc>l
vmap :w <Esc>:w<CR>
nmap :W :w
cmap wq w
cmap qw w
nmap <leader>s :set hlsearch<CR> *#
nmap q: :q

" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
inoremap jk <esc>

" Sooper simple tab completion
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! CdHist()
  let max  = histnr(':')
  let fmt  = ' %'.len(string(max)).'d '
  let list = filter(map(range(1, max), 'histget(":", - v:val)'), '!empty(v:val) && v:val =~ "^cd .*"')
  return map(list, 'matchlist(v:val, "^cd \\(.*\\)")[1]')
endfunction

nmap <leader>o :call fzf#run({
            \ 'source': CdHist(),
            \ 'sink': 'cd',
            \ 'down': '40%',
            \ })<cr>

nmap <leader>f :Ag<Space>
nnoremap <leader>F :Ag<Space><C-r><C-w><CR>
if exists("neovim_dot_app")
    call MacMenu("Window.Toggle Full Screen", "")
    nnoremap <D-f> :Ag<Space>
    nnoremap <D-S-f> :Ag<Space><C-r><C-w><CR>
endif

nnoremap <leader>g :!open "http://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q=<C-r><C-w>"<CR><CR>

if exists("neovim_dot_app")
    imap <S-D-e> <plug>(emmet-expand-abbr)
endif
command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

let b:surround_99 = "/* \r */"

iabbrev lgo log
