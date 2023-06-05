" Name:        Rosé Pine
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
  call extend(v:colornames, { 'base': '#232136' })
  call extend(v:colornames, { 'surface': '#2a273f' })
  call extend(v:colornames, { 'overlay': '#393552' })
  call extend(v:colornames, { 'muted': '#6e6a86' })
  call extend(v:colornames, { 'subtle': '#908caa' })
  call extend(v:colornames, { 'text': '#e0def4' })
  call extend(v:colornames, { 'love': '#eb6f92' })
  call extend(v:colornames, { 'gold': '#f6c177' })
  call extend(v:colornames, { 'rose': '#ea9a97' })
  call extend(v:colornames, { 'pine': '#3e8fb0' })
  call extend(v:colornames, { 'foam': '#9ccfd8' })
  call extend(v:colornames, { 'iris': '#c4a7e7' })
  call extend(v:colornames, { 'highlight_low': '#2a283e' })
  call extend(v:colornames, { 'highlight_med': '#44415a' })
  call extend(v:colornames, { 'highlight_high': '#56526e' })
else
  " Rosé Pine Dawn
  call extend(v:colornames, { 'base': '#faf4ed' })
  call extend(v:colornames, { 'surface': '#fffaf3' })
  call extend(v:colornames, { 'overlay': '#f2e9e1' })
  call extend(v:colornames, { 'muted': '#9893a5' })
  call extend(v:colornames, { 'subtle': '#797593' })
  call extend(v:colornames, { 'text': '#575279' })
  call extend(v:colornames, { 'love': '#b4637a' })
  call extend(v:colornames, { 'gold': '#ea9d34' })
  call extend(v:colornames, { 'rose': '#d7827e' })
  call extend(v:colornames, { 'pine': '#286983' })
  call extend(v:colornames, { 'foam': '#56949f' })
  call extend(v:colornames, { 'iris': '#907aa9' })
  call extend(v:colornames, { 'highlight_low': '#f4ede8' })
  call extend(v:colornames, { 'highlight_med': '#dfdad9' })
  call extend(v:colornames, { 'highlight_high': '#cecacd' })
endif

highlight Normal guifg=text guibg=base
highlight ColorColumn guifg=text guibg=highlight_low
