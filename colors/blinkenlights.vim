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
  " Catppuccin Macchiato
  " https://catppuccin.com/palette#flavor-macchiato
  let bl_base = '#191724'
  let bl_muted = '#6e6a86'
  let bl_text = '#e0def4'
  let bl_love = '#eb6f92'
  let bl_gold = '#f6c177'
  let bl_rose = '#ebbcba'
  let bl_pine = '#31748f'
  let bl_foam = '#9ccfd8'
  let bl_highlight_low = '#21202e'
  let bl_highlight_med = '#403d52'
else
  " Catppuccin Frappe
  " https://catppuccin.com/palette#flavor-frappe
  let bl_base = '#ffffff'
  let bl_muted = '#9893a5'
  let bl_text = '#575279'
  let bl_love = '#b4637a'
  let bl_gold = '#ea9d34'
  let bl_rose = '#d7827e'
  let bl_pine = '#286983'
  let bl_foam = '#56949f'
  let bl_highlight_low = '#f1f1f1'
  let bl_highlight_med = '#eeeeee'
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

let text = s:format({ 'guifg': bl_text, 'guibg': bl_base })
let subtle_text = s:format({ 'guifg': bl_muted, 'guibg': bl_base })
let error_text = s:format({ 'guifg': bl_rose, 'guibg': bl_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })
let active_window_text = s:format({ 'guifg': bl_text, 'guibg': bl_highlight_low, 'cterm': 'bold', 'gui': 'bold', 'term': 'bold' })
let active_tab_text = s:format({ 'guifg': bl_text, 'guibg': bl_base, 'cterm': 'bold', 'gui': 'bold', 'term': 'bold' })
let subtle_window_text = s:format({ 'guifg': bl_muted, 'guibg': bl_highlight_low, 'cterm': 'none', 'gui': 'none', 'term': 'none' })

execute 'highlight Normal ' . text
execute 'highlight NonText ' . subtle_text

" Programming statements
execute 'highlight Constant ' . text
execute 'highlight Statement ' . text
execute 'highlight Type ' . text
execute 'highlight PreProc ' . text
execute 'highlight Identifier ' . text
execute 'highlight Special ' . text
execute 'highlight String ' . text

" Navigation elements
execute 'highlight Directory ' . text
execute 'highlight helpStar ' . subtle_text
execute 'highlight helpBar ' . subtle_text

" Autocomplete menu
call Highlight('PMenu',    { 'guifg': bl_muted, 'guibg': bl_highlight_low })
call Highlight('PmenuSel', { 'guifg': bl_text,  'guibg': bl_highlight_med })

" Curosor, boundaries and columns
call Highlight('ColorColumn', { 'guibg': bl_highlight_low })
call Highlight('MatchParen',  { 'guifg': bl_text, 'guibg': bl_highlight_med, 'term': 'none' })
call Highlight('Visual',      { 'guibg': bl_highlight_med, 'guifg': bl_love })
call Highlight('Search',      { 'guifg': bl_base, 'guibg': bl_rose })
call Highlight('CurSearch',   { 'guifg': bl_base, 'guibg': bl_love })

" Errors
execute 'highlight Error ' . error_text
execute 'highlight ErrorMsg ' . error_text
execute 'highlight SpellBad ' . error_text
execute 'highlight SpellCap ' . error_text
execute 'highlight SpellLocal ' . error_text
execute 'highlight SpellRare ' . error_text

call Highlight('CursorLine',   { 'term': 'none', 'cterm': 'none', 'guifg': bl_text, 'guibg': bl_highlight_med })
call Highlight('CursorColumn', { 'term': 'none', 'cterm': 'none', 'guifg': bl_text, 'guibg': bl_highlight_med })
call Highlight('CursorLineNr', { 'term': 'none', 'cterm': 'none', 'guifg': bl_text, 'guibg': bl_highlight_med })

" Comments
execute 'highlight Comment ' . text
call Highlight('Todo',    { 'guifg': bl_foam, 'guibg': bl_base, 'cterm': 'underline', 'gui': 'underline', 'term': 'underline' })

" Diffs
call Highlight('DiffAdd',     { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_pine })
call Highlight('DiffChange',  { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_gold })
call Highlight('DiffDelete',  { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_love })
call Highlight('Diffbl_text',    { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_love })
call Highlight('diffAdded',   { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_pine })
call Highlight('diffRemoved', { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_love })

" Windowing
execute 'highlight LineNr ' . subtle_text
execute 'highlight StatusLine ' . active_window_text
execute 'highlight StatusLineNC ' . subtle_window_text
execute 'highlight WildMenu ' . text
execute 'highlight Folded ' . active_window_text
execute 'highlight VertSplit ' . subtle_window_text
execute 'highlight TabLine ' . subtle_window_text
execute 'highlight TabLineFill ' . subtle_window_text
execute 'highlight TabLineSel ' . active_tab_text

" Markdown
call Highlight('Title', { 'term': 'bold', 'guibg': bl_base, 'guifg': bl_text })

" Column with linting suggestions
call Highlight('SignColumn', { 'guibg': bl_highlight_low })

" Vim key highlights like <Enter> and <F1>
call Highlight('SpecialKey', { 'term': 'bold', 'ctermfg': 4, 'guifg': bl_rose })

" Squiggles at the bottom of the file
execute 'highlight Nonbl_text ' . subtle_text

" Things things that should stand out, that you don't want in code review
call Highlight('TrailingWhitespace', { 'guifg': bl_love, 'cterm': 'underline' })
match TrailingWhitespace /\s\+$/
