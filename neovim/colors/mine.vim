set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

set statusline=\ %f%m%=%l,%v\ 

" This highlights the current word
hi CursorOverWord cterm=underline ctermbg=none ctermfg=yellow
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


hi StatusLine   cterm=none      ctermfg=0         ctermbg=7
hi StatusLineNC cterm=none      ctermfg=7         ctermbg=0

hi TabLineFill cterm=none ctermfg=none ctermbg=none
hi TabLineSel  cterm=none ctermfg=0    ctermbg=7
hi TabLine     cterm=none ctermfg=7    ctermbg=0

hi Search       cterm=reverse   ctermfg=DarkGray  ctermbg=none
hi CursorLineNr cterm=reverse   ctermfg=DarkGray  ctermbg=none
hi LineNr       cterm=None      ctermfg=DarkGray  ctermbg=None
hi SignColumn   cterm=None      ctermfg=None      ctermbg=None
hi VertSplit    cterm=None      ctermfg=Black     ctermbg=None
hi Visual       cterm=None      ctermfg=Black     ctermbg=Yellow
hi SpellBad     cterm=underline ctermfg=None      ctermbg=None
hi SpellCap     cterm=None      ctermfg=None      ctermbg=None
hi PMenu        cterm=None      ctermfg=LightGray ctermbg=DarkGray
hi Folded       cterm=None      ctermfg=LightGray ctermbg=None

hi DiffAdd    cterm=none ctermfg=green ctermbg=none
hi DiffChange cterm=none ctermfg=blue  ctermbg=none
hi DiffDelete cterm=none ctermfg=red   ctermbg=none


" syntax
hi Comment    cterm=None ctermfg=DarkGray   ctermbg=None
hi Constant   cterm=None ctermfg=Green      ctermbg=None
hi Special    cterm=None ctermfg=None       ctermbg=None
hi Identifier cterm=None ctermfg=DarkCyan   ctermbg=None
hi Statement  cterm=None ctermfg=DarkBlue   ctermbg=None
hi PreProc    cterm=None ctermfg=DarkBlue   ctermbg=None
hi Type       cterm=None ctermfg=DarkBlue   ctermbg=None
hi Ignore     cterm=None ctermfg=None       ctermbg=None
hi Error      cterm=None ctermfg=DarkRed    ctermbg=None
hi Todo       cterm=None ctermfg=DarkYellow ctermbg=None
