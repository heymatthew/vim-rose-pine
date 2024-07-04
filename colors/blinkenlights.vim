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
  " Rosé Pine
  let base = '#191724'
  let surface = '#1f1d2e'
  let overlay = '#26233a'
  let muted = '#6e6a86'
  let subtle = '#908caa'
  let text = '#e0def4'
  let love = '#eb6f92'
  let gold = '#f6c177'
  let rose = '#ebbcba'
  let pine = '#31748f'
  let foam = '#9ccfd8'
  let iris = '#c4a7e7'
  let highlight_low = '#21202e'
  let highlight_med = '#403d52'
  let highlight_high = '#524f67'
else
  " Rosé Pine Dawn
  let base = '#faf4ed'
  let surface = '#fffaf3'
  let overlay = '#f2e9e1'
  let muted = '#9893a5'
  let subtle = '#797593'
  let text = '#575279'
  let love = '#b4637a'
  let gold = '#ea9d34'
  let rose = '#d7827e'
  let pine = '#286983'
  let foam = '#56949f'
  let iris = '#907aa9'
  let highlight_low = '#f4ede8'
  let highlight_med = '#dfdad9'
  let highlight_high = '#cecacd'
endif

" Highlight passes args to :highlight
" e.g. call Highlight('Normal', {'a': 1, 'b': 2})
"   ~> :highlight Normal a=1 b=2
function Highlight(group, args)
  let hl_args = map(a:args, { k, v -> printf('%s=%s', k, v) })
  let hl_args = join(values(hl_args), ' ')
  execute printf('highlight %s %s', a:group, hl_args)
endfunction

call Highlight('Normal', { 'guifg': text, 'guibg': base })

" Programming statements
call Highlight('Constant',   { 'guifg': text, 'guibg': base })
call Highlight('Statement',  { 'guifg': text, 'guibg': base })
call Highlight('Type',       { 'guifg': text, 'guibg': base })
call Highlight('PreProc',    { 'guifg': text, 'guibg': base })
call Highlight('Identifier', { 'guifg': text, 'guibg': base })
call Highlight('Special',    { 'guifg': text, 'guibg': base })

" Navigation elements
call Highlight('Directory',         { 'guifg': pine, 'guibg': base })
call Highlight('helpHyperTextJump', { 'guifg': pine, 'guibg': base })

" Autocomplete menu
call Highlight('PMenu',    { 'guifg': muted, 'guibg': highlight_low })
call Highlight('PmenuSel', { 'guifg': text,  'guibg': highlight_med })

" Curosor, boundaries and columns
call Highlight('ColorColumn', { 'guibg': highlight_low })
call Highlight('MatchParen',  { 'guifg': iris, 'guibg': highlight_med, 'term': 'none' })
call Highlight('Visual',      { 'guibg': highlight_med, 'guifg': love })
call Highlight('Search',      { 'guifg': base, 'guibg': rose })
call Highlight('CurSearch',   { 'guifg': base, 'guibg': love })

" Errors
call Highlight('Error',        { 'guifg': rose, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('ErrorMsg',     { 'guifg': rose, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellBad',     { 'guifg': rose, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellCap',     { 'guifg': rose, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellLocal',   { 'guifg': rose, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('SpellRare',    { 'guifg': rose, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
call Highlight('CursorLine',   { 'term': 'none', 'cterm': 'none', 'guifg': text, 'guibg': highlight_med })
call Highlight('CursorColumn', { 'term': 'none', 'cterm': 'none', 'guifg': text, 'guibg': highlight_med })
call Highlight('CursorLineNr', { 'term': 'none', 'cterm': 'none', 'guifg': text, 'guibg': highlight_med })

" Comments
call Highlight('Comment', { 'guifg': text, 'guibg': base })
call Highlight('Todo',    { 'guifg': foam, 'guibg': base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })

" Diffs
call Highlight('DiffAdd',     { 'term': 'bold', 'guibg': base, 'guifg': pine })
call Highlight('DiffChange',  { 'term': 'bold', 'guibg': base, 'guifg': gold })
call Highlight('DiffDelete',  { 'term': 'bold', 'guibg': base, 'guifg': love })
call Highlight('DiffText',    { 'term': 'bold', 'guibg': base, 'guifg': love })
call Highlight('diffAdded',   { 'term': 'bold', 'guibg': base, 'guifg': pine })
call Highlight('diffRemoved', { 'term': 'bold', 'guibg': base, 'guifg': love })

" Windowing
call Highlight('LineNr',       { 'guifg': muted, 'guibg': base })
call Highlight('StatusLine',   { 'guifg': iris, 'guibg': highlight_low, 'cterm': 'bold', 'gui': 'bold', 'term': 'bold' })
call Highlight('StatusLineNC', { 'guifg': iris, 'guibg': highlight_low, 'cterm': 'none', 'gui': 'none', 'term': 'none' })
call Highlight('Folded',       { 'guifg': rose, 'guibg': base, 'cterm': 'none', 'gui': 'none', 'term': 'none' })
call Highlight('VertSplit',    { 'guifg': highlight_med, 'guibg': highlight_low })
call Highlight('TabLine',      { 'term': 'underline', 'cterm': 'underline', 'gui': 'underline', 'guibg': highlight_med })
call Highlight('TabLineFill',  { 'term': 'underline', 'cterm': 'underline', 'gui': 'underline', 'guibg': highlight_med })
call Highlight('TabLineSel',   { 'term': 'bold', 'cterm': 'bold', 'gui': 'bold' })
call Highlight('WildMenu',     { 'guifg': love, 'guibg': base })

" Markdown
call Highlight('Title', { 'term': 'bold', 'guibg': base, 'guifg': iris })

" Column with linting suggestions
call Highlight('SignColumn', { 'guibg': highlight_low })

" Vim key highlights like <Enter> and <F1>
call Highlight('SpecialKey', { 'term': 'bold', 'ctermfg': 4, 'guifg': rose })

" Squiggles at the bottom of the file
call Highlight('NonText', { 'term': 'bold', 'ctermfg': 12, 'gui': 'bold', 'guifg': iris })

" Things things that should stand out, that you don't want in code review
call Highlight('TrailingWhitespace', { 'guifg': love, 'cterm': 'underline' })
match TrailingWhitespace /\s\+$/
