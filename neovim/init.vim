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
let mapleader = ","

runtime defaults.vim
runtime plugins.vim

let base16colorspace=256
colorscheme base16-paraiso

" Prefer control mappings for multiple actions
" Otherwise <leader>KEY is faster
" Prefer function keys for meta vim actions
noremap <F4> :e ~/.config/nvim/init.vim<CR>
noremap <F5> :PlugInstall<CR>
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd! bufwritepost ~/.config/nvim/defaults.vim source ~/.config/nvim/init.vim
autocmd! bufwritepost ~/.config/nvim/plugins.vim source ~/.config/nvim/init.vim

" Plugins
nmap <leader>p :FZF<CR>
nmap <leader>c <plug>NERDCommenterToggle<CR>
vmap <leader>c <plug>NERDCommenterToggle<CR>
noremap <leader>f :Autoformat<CR>

" Autocomplete mappings
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Esc>  pumvisible() ? deoplete#undo_completion() : "\<Esc>"
inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"

imap <expr> <Tab> pumvisible() ? "\<C-n>" : TabComplete()
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! TabComplete()
    if !CheckBackSpace()
        if len(UltiSnips#SnippetsInCurrentScope()) > 0
            return "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>"
        endif
        if &filetype =~ 'html\|css\|less\|sass|\scss\|jsx\|vue' && emmet#isExpandable()
            return "\<plug>(emmet-expand-abbr)"
        endif
        return deoplete#manual_complete()
    endif
    return "\<Tab>"
endfunction

function! CheckBackSpace()
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Add control mappings, they are faster for multiple actions
nmap <C-Left> :bprev<CR>
nmap <C-Right> :bnext<CR>
nmap <leader><leader> <C-^>
nmap <leader>q :bd<CR>
nmap <leader>Q :bd!<CR>

nmap <leader>h :set hlsearch! hlsearch?<CR>
nmap <leader>v :normal! v/[\(\){}\[\]]<CR>%
nmap <leader>V :normal! V$?[\(\){}\[\]]<CR>%
nmap <leader>a ggVG
vmap <leader>y :y*<CR>
nmap <leader>o a<CR><esc>
nnoremap <leader>l `[v`]

" Overrides
nmap Q <nop>
nmap H ^
nmap L $
nmap D dd
nmap <tab> >>
nmap <s-tab> <<
vmap <tab> >gv
vmap <s-tab> <gv
nnoremap ci( /(<CR>ci(
nnoremap ci{ /{<CR>ci{

imap :w <Esc>:w<CR>
inoremap <Esc> <Esc>l
vmap :w <Esc>:w<CR>
nmap :W :w<CR>
nmap <leader>b :ls<CR>:b <c-z><s-tab>

iabbrev lgo log
