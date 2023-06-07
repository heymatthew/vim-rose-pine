" Name:        Rosé Pine blinkenlights
" Description: All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
" Author:      Matthew Gray
" License:     GPLv3
" Version:     0.1
" Website:     https://github.com/heymatthew/vim-rosepine

let g:colors_name = "rosepine"
highlight clear
set termguicolors " truecolor s
if exists("syntax_on")
  syntax reset
endif

if &background == 'dark'
  " Rosé Pine Moon
  let v:colornames['base'] = '#232136'
  let v:colornames['surface'] = '#2a273f'
  let v:colornames['overlay'] = '#393552'
  let v:colornames['muted'] = '#6e6a86'
  let v:colornames['subtle'] = '#908caa'
  let v:colornames['text'] = '#e0def4'
  let v:colornames['love'] = '#eb6f92'
  let v:colornames['gold'] = '#f6c177'
  let v:colornames['rose'] = '#ea9a97'
  let v:colornames['pine'] = '#3e8fb0'
  let v:colornames['foam'] = '#9ccfd8'
  let v:colornames['iris'] = '#c4a7e7'
  let v:colornames['highlight_low'] = '#2a283e'
  let v:colornames['highlight_med'] = '#44415a'
  let v:colornames['highlight_high'] = '#56526e'
else
  " Rosé Pine Dawn
  let v:colornames['base'] = '#faf4ed'
  let v:colornames['surface'] = '#fffaf3'
  let v:colornames['overlay'] = '#f2e9e1'
  let v:colornames['muted'] = '#9893a5'
  let v:colornames['subtle'] = '#797593'
  let v:colornames['text'] = '#575279'
  let v:colornames['love'] = '#b4637a'
  let v:colornames['gold'] = '#ea9d34'
  let v:colornames['rose'] = '#d7827e'
  let v:colornames['pine'] = '#286983'
  let v:colornames['foam'] = '#56949f'
  let v:colornames['iris'] = '#907aa9'
  let v:colornames['highlight_low'] = '#f4ede8'
  let v:colornames['highlight_med'] = '#dfdad9'
  let v:colornames['highlight_high'] = '#cecacd'
endif

highlight Normal      guifg=text guibg=base

" Language features
highlight String      guifg=text guibg=base
highlight Character   guifg=text guibg=base
highlight Number      guifg=text guibg=base
highlight Boolean     guifg=text guibg=base
highlight Float       guifg=text guibg=base
highlight Constant    guifg=text guibg=base
highlight PreProc     guifg=text guibg=base
highlight Statement   guifg=text guibg=base
highlight Identifier  guifg=text guibg=base
highlight Type        guifg=text guibg=base
highlight PreProc     guifg=text guibg=base
highlight Special     guifg=text guibg=base

" File navigation
highlight Directory   guifg=pine guibg=base

" Autocomplete menu
highlight PMenu       guifg=muted guibg=highlight_low
highlight PmenuSel    guifg=text  guibg=highlight_med

" Curosor, boundaries and columns
highlight Cursor      guifg=text guifg=rose
highlight lCursor     guifg=text guifg=rose
highlight ColorColumn guifg=text guibg=highlight_low
highlight MatchParen  guifg=base guibg=gold term=none

highlight Search      guifg=base guibg=foam
highlight CurSearch   guifg=base guibg=pine

" Errors
highlight SpellBad    guifg=rose guibg=base cterm=underline gui=underline term=underline
highlight ErrorMsg    guifg=rose guibg=base cterm=underline gui=underline term=underline
highlight Error       guifg=rose guibg=base cterm=underline gui=underline term=underline

" Comments
highlight Comment   guifg=muted guibg=base
highlight Todo      guifg=gold guibg=base cterm=underline gui=underline term=underline

" Windowing
" highlight VertSplit guifg=text guibg=highlight_low
highlight LineNr    guifg=muted guibg=base

" highlight CursorLine
" VertSplit TabLine TabLineFill
" TabLineSel
