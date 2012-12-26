set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="meltonbw"

"--------------------------------------------------------------------

" ***** General Highlighting *****
hi Cursor			gui=bold			guibg=#ffff33		guifg=#ff0000
hi CursorColumn							guibg=#001100
hi CursorLine							guibg=#001800
hi DiffAdd								guibg=#333333		guifg=#0000ff
hi DiffChange							guibg=#333333		guifg=#0000ff
hi DiffDelete							guibg=#333333		guifg=#0000ff
hi DiffText								guibg=#333333		guifg=#ffffff
hi Directory							guibg=#000000		guifg=#0000ff
hi ErrorMsg								guibg=#ffffff		guifg=#000000
hi FoldColumn							guibg=#222222		guifg=#ff0000
hi Folded								guibg=#222222		guifg=#ff0000
hi Identifier							guibg=#000000		guifg=#89cffd
hi IncSearch		gui=none			guibg=#0000bb		guifg=#000000
hi LineNr								guibg=#000000		guifg=#000088
hi MatchParen		gui=none			guibg=#222222		guifg=#0000ff
hi ModeMsg								guibg=#000000		guifg=#0000ff
hi MoreMsg								guibg=#000000		guifg=#0000ff
hi NonText								guibg=#000000		guifg=#3f3f3f
hi PreProc			gui=none								guifg=#ffffff
hi Question													guifg=#0000ff
hi Search			gui=none			guibg=#0000ff		guifg=#000000
hi SignColumn							guibg=#111111		guifg=#ffffff
hi Special			gui=none			guibg=#000000		guifg=#ffffff
hi SpecialKey							guibg=#080808		guifg=#181818
hi StatusLine		gui=none			guibg=#0000ff		guifg=#000000
hi StatusLineNC		gui=none			guibg=#444444		guifg=#000000
hi TabLine			gui=none			guibg=#444444		guifg=#000000
hi TabLineFill		gui=underline		guibg=#000000		guifg=#ffffff
hi TabLineSel		gui=none			guibg=#0000aa		guifg=#000000
hi Title			gui=none								guifg=#0000ff
hi Todo				gui=none			guibg=#000000		guifg=#ff0000
hi VertSplit		gui=none			guibg=#000000		guifg=#ffffff
hi Visual								guibg=#0000dd		guifg=#000000
hi WarningMsg							guibg=#888888		guifg=#000000


" ***** General Program Syntax *****

hi Normal			gui=none			guibg=#000000		guifg=#e0e0e0

" Functions
hi Function			gui=bold								guifg=#00ff00	"Bold green
hi StdFunction		gui=bold								guifg=#00ff00	"Bold green

" Statements
hi Conditional		gui=bold								guifg=#ff0000	"Bold red
hi Label			gui=bold								guifg=#ff0000	"Bold red
hi Name				gui=none								guifg=#89cffd
hi Repeat			gui=bold								guifg=#ff0000	"Bold red
hi Statement		gui=bold								guifg=#ff0000	"Bold red
hi Type				gui=none								guifg=#0070ff

" Constant Expressions
hi Boolean			gui=none								guifg=#ffff33
hi Character		gui=none								guifg=#ff80ff
hi Constant			gui=bold								guifg=#0000ff
hi Float			gui=none								guifg=#ff4500
hi Number			gui=none								guifg=#ff7f00
hi String			gui=none								guifg=#ee00ee

" Misc
hi Comment			gui=none								guifg=#ffffff
hi Error			gui=none			guibg=#ff0000		guifg=#ffffff

" Unknown

hi Identifier		gui=none			guibg=#ff0000		guifg=#89cffd
hi Include			gui=none			guibg=#ff0000		guifg=#ff0000
hi Macro			gui=none			guibg=#ff0000		guifg=#ff0000
hi Operator			gui=none			guibg=#ff0000		guifg=#ff0000

" ***** C Program Syntax *****
hi cBinary			gui=none			guibg=#ff0000		guifg=#00ff00
hi cBinaryZero		gui=none			guibg=#ff0000		guifg=#00ff00
hi cOctal			gui=none								guifg=#ff9933
hi cOctalZero		gui=none								guifg=#ff9933
