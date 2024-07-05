scriptencoding utf-8

" Name:        Blinkenlights
" Description: Diagnostic lights from old mainframe computers
" Author:      Matthew B. Gray
" License:     GPLv3
" Version:     0.1
" Website:     https://github.com/heymatthew/vim-blinkenlights

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'blinkenlights'
set termguicolors " true-color

let colornames = {}
if exists('v:colornames')
  let colornames = v:colornames
endif

if &background ==# 'dark'
  " Rosé rp_Pine
  let rp_base = '#191724'
  let rp_surface = '#1f1d2e'
  let rp_overlay = '#26233a'
  let rp_muted = '#6e6a86'
  let rp_subtle = '#908caa'
  let rp_text = '#e0def4'
  let rp_love = '#eb6f92'
  let rp_gold = '#f6c177'
  let rp_rose = '#ebbcba'
  let rp_pine = '#31748f'
  let rp_foam = '#9ccfd8'
  let rp_iris = '#c4a7e7'
  let rp_highlight_low = '#21202e'
  let rp_highlight_med = '#403d52'
  let rp_highlight_high = '#524f67'
else
  " Rosé rp_Pine Dawn
  let rp_base = '#faf4ed'
  let rp_surface = '#fffaf3'
  let rp_overlay = '#f2e9e1'
  let rp_muted = '#9893a5'
  let rp_subtle = '#797593'
  let rp_text = '#575279'
  let rp_love = '#b4637a'
  let rp_gold = '#ea9d34'
  let rp_rose = '#d7827e'
  let rp_pine = '#286983'
  let rp_foam = '#56949f'
  let rp_iris = '#907aa9'
  let rp_highlight_low = '#f4ede8'
  let rp_highlight_med = '#dfdad9'
  let rp_highlight_high = '#cecacd'
endif

" Highlight passes args to :highlight
" e.g. call Highlight('Normal', {'a': 1, 'b': 2})
"   ~> :highlight Normal a=1 b=2
function Highlight(group, args)
  let hl_args = deepcopy(a:args)
  let hl_args = map(a:args, { k, v -> printf('%s=%s', k, v) })
  let hl_args = join(values(hl_args), ' ')
  execute printf('highlight %s %s', a:group, hl_args)
endfunction

function s:format(asHash)
  let asStrings = map(a:asHash, { k, v -> printf('%s=%s', k, v) })
  return join(values(asStrings), ' ')
endfunction

let text = s:format({ 'guifg': rp_text, 'guibg': rp_base })
let subtle_text = s:format({ 'guifg': rp_muted, 'guibg': rp_base })

execute 'highlight Normal ' . text

" Programming statements
execute 'highlight Constant ' . text
execute 'highlight Statement ' . text
execute 'highlight Type ' . text
execute 'highlight PreProc ' . text
execute 'highlight Identifier ' . text
execute 'highlight Special ' . text

" Navigation elements
call Highlight('Directory',         { 'guifg': rp_pine, 'guibg': rp_base })
call Highlight('helpHyperrp_textJump', { 'guifg': rp_pine, 'guibg': rp_base })

" Autocomplete menu
call Highlight('PMenu',    { 'guifg': rp_muted, 'guibg': rp_highlight_low })
call Highlight('PmenuSel', { 'guifg': rp_text,  'guibg': rp_highlight_med })

" Curosor, boundaries and columns
call Highlight('ColorColumn', { 'guibg': rp_highlight_low })
call Highlight('MatchParen',  { 'guifg': rp_iris, 'guibg': rp_highlight_med, 'term': 'none' })
call Highlight('Visual',      { 'guibg': rp_highlight_med, 'guifg': rp_love })
call Highlight('Search',      { 'guifg': rp_base, 'guibg': rp_rose })
call Highlight('CurSearch',   { 'guifg': rp_base, 'guibg': rp_love })

" Errors
call Highlight('Error',        { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('ErrorMsg',     { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellBad',     { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellCap',     { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellLocal',   { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellRare',    { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('CursorLine',   { 'term': 'none', 'cterm': 'none', 'guifg': rp_text, 'guibg': rp_highlight_med })
call Highlight('CursorColumn', { 'term': 'none', 'cterm': 'none', 'guifg': rp_text, 'guibg': rp_highlight_med })
call Highlight('CursorLineNr', { 'term': 'none', 'cterm': 'none', 'guifg': rp_text, 'guibg': rp_highlight_med })

" Comments
execute 'highlight Comment ' . text
call Highlight('Todo',    { 'guifg': rp_foam, 'guibg': rp_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })

" Diffs
call Highlight('DiffAdd',     { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_pine })
call Highlight('DiffChange',  { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_gold })
call Highlight('DiffDelete',  { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_love })
call Highlight('Diffrp_text',    { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_love })
call Highlight('diffAdded',   { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_pine })
call Highlight('diffRemoved', { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_love })

" Windowing
execute 'highlight LineNr ' . subtle_text
call Highlight('StatusLine',   { 'guifg': rp_iris, 'guibg': rp_highlight_low, 'cterm': 'bold', 'gui': 'bold', 'term': 'bold' })
call Highlight('StatusLineNC', { 'guifg': rp_iris, 'guibg': rp_highlight_low, 'cterm': 'none', 'gui': 'none', 'term': 'none' })
call Highlight('Folded',       { 'guifg': rp_rose, 'guibg': rp_base, 'cterm': 'none', 'gui': 'none', 'term': 'none' })
call Highlight('VertSplit',    { 'guifg': rp_highlight_med, 'guibg': rp_highlight_low })
call Highlight('TabLine',      { 'term': 'underline', 'cterm': 'underline', 'gui': 'underline', 'guibg': rp_highlight_med })
call Highlight('TabLineFill',  { 'term': 'underline', 'cterm': 'underline', 'gui': 'underline', 'guibg': rp_highlight_med })
call Highlight('TabLineSel',   { 'term': 'bold', 'cterm': 'bold', 'gui': 'bold' })
call Highlight('WildMenu',     { 'guifg': rp_love, 'guibg': rp_base })

" Markdown
call Highlight('Title', { 'term': 'bold', 'guibg': rp_base, 'guifg': rp_iris })

" Column with linting suggestions
call Highlight('SignColumn', { 'guibg': rp_highlight_low })

" Vim key highlights like <Enter> and <F1>
call Highlight('SpecialKey', { 'term': 'bold', 'ctermfg': 4, 'guifg': rp_rose })

" Squiggles at the bottom of the file
call Highlight('Nonrp_text', { 'term': 'bold', 'ctermfg': 12, 'gui': 'bold', 'guifg': rp_iris })

" Things things that should stand out, that you don't want in code review
call Highlight('TrailingWhitespace', { 'guifg': rp_love, 'cterm': 'underline' })
match TrailingWhitespace /\s\+$/
