" Vim color scheme file
" Created for VSCode Dark+ theme
" Maintainer: dotfiles

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "vscode-dark"

" Color definitions (VSCode Dark+ palette)
let s:bg = '#1F1F1F'
let s:fg = '#D4D4D4'
let s:comment = '#6A9955'
let s:keyword = '#569CD6'
let s:string = '#CE9178'
let s:number = '#B5CEA8'
let s:function = '#DCDCAA'
let s:variable = '#9CDCFE'
let s:type = '#4EC9B0'
let s:constant = '#4FC1FF'
let s:tag = '#D7BA7D'
let s:attribute = '#92C5F7'
let s:operator = '#D4D4D4'
let s:preprocessor = '#C586C0'
let s:red = '#F44747'
let s:white = '#FFFFFF'
let s:line_bg = '#2D2D30'
let s:selection = '#264F78'
let s:cursor_line = '#282828'
let s:statusline_bg = '#007ACC'
let s:statusline_fg = '#FFFFFF'
let s:gutter_bg = '#1E1E1E'
let s:gutter_fg = '#858585'

" Helper function to set highlight
function! s:hi(group, fg, bg, attr)
  let l:cmd = 'hi ' . a:group
  if a:fg != '' | let l:cmd .= ' guifg=' . a:fg | endif
  if a:bg != '' | let l:cmd .= ' guibg=' . a:bg | endif
  if a:attr != '' | let l:cmd .= ' gui=' . a:attr | endif
  execute l:cmd
endfunction

" Normal text
call s:hi('Normal', s:fg, s:bg, '')
call s:hi('NonText', '#4D4D4D', s:bg, '')
call s:hi('EndOfBuffer', '#4D4D4D', s:bg, '')

" Cursor
call s:hi('Cursor', s:bg, s:fg, '')
call s:hi('CursorLine', '', s:cursor_line, 'none')
call s:hi('CursorLineNr', s:white, s:cursor_line, '')
call s:hi('CursorColumn', '', s:cursor_line, '')

" Line numbers
call s:hi('LineNr', s:gutter_fg, s:gutter_bg, '')
call s:hi('SignColumn', '', s:gutter_bg, '')

" Selection
call s:hi('Visual', '', s:selection, '')
call s:hi('VisualNOS', '', s:selection, '')

" Search
call s:hi('Search', s:bg, '#515C6A', '')
call s:hi('IncSearch', s:bg, '#515C6A', 'bold')

" Status line
call s:hi('StatusLine', s:statusline_fg, s:statusline_bg, 'bold')
call s:hi('StatusLineNC', '#CCCCCC', '#3E3E42', '')
call s:hi('WildMenu', s:bg, s:statusline_bg, '')

" Menu
call s:hi('Pmenu', s:fg, '#252526', '')
call s:hi('PmenuSel', s:white, s:selection, '')
call s:hi('PmenuSbar', '', '#323233', '')
call s:hi('PmenuThumb', '', '#424242', '')

" Tabs
call s:hi('TabLine', '#8B8B8B', '#2D2D2D', '')
call s:hi('TabLineSel', s:white, s:bg, 'bold')
call s:hi('TabLineFill', '', '#2D2D2D', '')

" Folding
call s:hi('Folded', '#AAAAAA', '#2D2D30', 'italic')
call s:hi('FoldColumn', s:gutter_fg, s:gutter_bg, '')

" Diff
call s:hi('DiffAdd', '', '#144212', '')
call s:hi('DiffChange', '', '#2A3967', '')
call s:hi('DiffDelete', '', '#3F1E1E', '')
call s:hi('DiffText', '', '#3E5070', 'bold')

" Syntax highlighting
call s:hi('Comment', s:comment, '', 'italic')
call s:hi('Constant', s:constant, '', '')
call s:hi('String', s:string, '', '')
call s:hi('Character', s:string, '', '')
call s:hi('Number', s:number, '', '')
call s:hi('Boolean', s:constant, '', '')
call s:hi('Float', s:number, '', '')

call s:hi('Identifier', s:variable, '', '')
call s:hi('Function', s:function, '', '')

call s:hi('Statement', s:keyword, '', '')
call s:hi('Conditional', s:keyword, '', '')
call s:hi('Repeat', s:keyword, '', '')
call s:hi('Label', s:keyword, '', '')
call s:hi('Operator', s:operator, '', '')
call s:hi('Keyword', s:keyword, '', '')
call s:hi('Exception', s:keyword, '', '')

call s:hi('PreProc', s:preprocessor, '', '')
call s:hi('Include', s:preprocessor, '', '')
call s:hi('Define', s:preprocessor, '', '')
call s:hi('Macro', s:preprocessor, '', '')
call s:hi('PreCondit', s:preprocessor, '', '')

call s:hi('Type', s:type, '', '')
call s:hi('StorageClass', s:keyword, '', '')
call s:hi('Structure', s:keyword, '', '')
call s:hi('Typedef', s:type, '', '')

call s:hi('Special', s:attribute, '', '')
call s:hi('SpecialChar', s:string, '', '')
call s:hi('Tag', s:tag, '', '')
call s:hi('Delimiter', s:fg, '', '')
call s:hi('SpecialComment', s:comment, '', 'italic')
call s:hi('Debug', s:red, '', '')

call s:hi('Underlined', s:attribute, '', 'underline')
call s:hi('Error', s:red, '#3F1E1E', 'bold')
call s:hi('Todo', s:tag, '', 'bold,italic')

" Markdown
call s:hi('markdownBold', s:fg, '', 'bold')
call s:hi('markdownItalic', s:fg, '', 'italic')
call s:hi('markdownCode', s:string, '', '')
call s:hi('markdownLinkText', s:function, '', 'underline')

" Shell
call s:hi('shQuote', s:string, '', '')
call s:hi('shStatement', s:keyword, '', '')

" JavaScript / TypeScript
call s:hi('javaScriptFunction', s:keyword, '', '')
call s:hi('javaScriptNumber', s:number, '', '')
call s:hi('javaScriptStringS', s:string, '', '')
call s:hi('javaScriptStringD', s:string, '', '')
call s:hi('javaScriptIdentifier', s:variable, '', '')
call s:hi('typescriptKeyword', s:keyword, '', '')
call s:hi('typescriptFunction', s:function, '', '')

" Python
call s:hi('pythonBuiltin', s:function, '', '')
call s:hi('pythonStatement', s:keyword, '', '')
call s:hi('pythonString', s:string, '', '')

" HTML/XML
call s:hi('htmlTag', s:tag, '', '')
call s:hi('htmlEndTag', s:tag, '', '')
call s:hi('htmlTagName', s:tag, '', '')
call s:hi('htmlArg', s:attribute, '', '')
call s:hi('htmlString', s:string, '', '')

" CSS
call s:hi('cssTagName', s:tag, '', '')
call s:hi('cssClassName', s:type, '', '')
call s:hi('cssValueNumber', s:number, '', '')
call s:hi('cssColor', s:number, '', '')

" Git
call s:hi('gitcommitComment', s:comment, '', 'italic')
call s:hi('gitcommitSelectedFile', s:number, '', '')
call s:hi('gitcommitDiscardedFile', s:red, '', '')

" Spelling
call s:hi('SpellBad', '', '', 'undercurl')
call s:hi('SpellCap', '', '', 'undercurl')
call s:hi('SpellRare', '', '', 'undercurl')
call s:hi('SpellLocal', '', '', 'undercurl')

" Terminal colors (for :terminal)
if has('terminal')
  let g:terminal_ansi_colors = [
        \ '#1E1E1E', '#F44747', '#6A9955', '#D7BA7D',
        \ '#569CD6', '#C586C0', '#4EC9B0', '#D4D4D4',
        \ '#808080', '#F44747', '#6A9955', '#D7BA7D',
        \ '#569CD6', '#C586C0', '#4EC9B0', '#FFFFFF'
        \ ]
endif
