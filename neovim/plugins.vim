call plug#begin('~/.vim/plugged')
    Plug 'chriskempson/base16-vim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'honza/vim-snippets'
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sleuth'
    Plug 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims = 1
    let g:NERDCreateDefaultMappings = 0
    let g:NERDDefaultAlign = 'left'
    Plug 'tmhedberg/matchit'
    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_map_keys = 0
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/emmet-vim'
    Plug 'davidhalter/jedi-vim'
    let g:jedi#goto_assignments_command = ""
    let g:jedi#goto_definitions_command = '<c-]>'
    let g:jedi#documentation_command = ""
    let g:jedi#usages_command = ""
    let g:jedi#completions_command = ""
    let g:jedi#rename_command = ""

    if executable('ag')
        let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif

    Plug 'terryma/vim-multiple-cursors'
    " Called once right before you start selecting multiple cursors
    function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
        exe 'NeoCompleteLock'
    endif
    endfunction

    " Called once only when the multiple selection is canceled (default <Esc>)
    function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
        exe 'NeoCompleteUnlock'
    endif
    endfunction

    Plug 'SirVer/ultisnips'
    let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsExpandTrigger = "<c-@>"
    autocmd FileType vue UltiSnipsAddFiletypes javascript

    Plug 'Shougo/deoplete.nvim'
    " Show menu when there is only one match
    " Show longest match first
    let g:deoplete#enable_at_startup = 1
    " let g:deoplete#disable_auto_complete=1
    let g:deoplete#enable_smart_case = 1

    " Below are plugins with config, in no particular order
    Plug 'Chiel92/vim-autoformat'
    " --unformatted '' means all tags will be formatted
    let g:formatdef_vue = '"html-beautify --unformatted ''''"'
    let g:formatters_vue = ['vue']

    Plug 'benekastah/neomake'
    autocmd! BufWritePost,BufEnter * Neomake
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

    Plug 'vim-airline/vim-airline'
    set laststatus=2
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#tabline#show_tabs = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline_left_sep=''
    let g:airline_right_sep=''

    " Syntaxes
    Plug 'kchmck/vim-coffee-script'
    Plug 'StanAngeloff/php.vim'
    Plug 'shawncplus/phpcomplete.vim'
    Plug 'groenewege/vim-less'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'othree/html5.vim'
    Plug 'derekwyatt/vim-scala'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'posva/vim-vue'
    Plug 'evidens/vim-twig'
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    let g:javascript_enable_domhtmlcss=1
    Plug 'sekel/vim-vue-syntastic'
    Plug 'fatih/vim-go'
    Plug 'flowtype/vim-flow'

call plug#end()
