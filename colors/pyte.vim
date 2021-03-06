
set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "pyte"
"
" Html-Titles
hi Title      guifg=#202020 gui=bold
hi Underlined  guifg=#202020 gui=underline


hi Cursor    guifg=black   guibg=#b0b4b8
hi lCursor   guifg=black   guibg=white
hi LineNr    guifg=#ffffff guibg=#c0d0e0

hi Normal    guifg=#202020   guibg=#f0f0f0

hi StatusLine guifg=white guibg=#8090a0 gui=bold,italic
hi StatusLineNC guifg=#506070 guibg=#a0b0c0 gui=italic
hi VertSplit guifg=#a0b0c0 guibg=#a0b0c0 gui=NONE

hi Folded    guifg=#708090 guibg=#c0d0e0

hi NonText                 guibg=#e0e0e0
" Kommentare
hi Comment   guifg=#a0b0c0               gui=italic

" Konstanten
hi Constant  guifg=#a07040
hi String    guifg=#4070a0 
hi Number    guifg=#40a070
hi Float     guifg=#70a040
"hi Statement guifg=#0070e0 gui=NONE
" Python: def and so on, html: tag-names
hi Statement  guifg=#007020 gui=bold


" HTML: arguments
hi Type       guifg=#e5a00d gui=italic
" Python: Standard exceptions, True&False
hi Structure  guifg=#007020 gui=italic
hi Function   guifg=#06287e gui=italic

hi Identifier guifg=#5b3674 gui=italic

hi Repeat      guifg=#7fbf58 gui=bold
hi Conditional guifg=#4c8f2f gui=bold

" Cheetah: #-Symbol, function-names
hi PreProc    guifg=#1060a0 gui=NONE
" Cheetah: def, for and so on, Python: Decorators
hi Define      guifg=#1060a0 gui=bold

hi Error      guifg=white guibg=red
"hi Todo       guifg=#a0b0c0 guibg=NONE gui=italic,bold,underline
hi Todo		guifg=#CFBC9B guibg=NONE gui=italic,bold,underline

" Python: %(...)s - constructs, encoding
hi Special    guifg=#70a0d0 gui=italic

hi Operator   guifg=#408010

" color of <TAB>s etc...  
hi SpecialKey guifg=#d8a080 guibg=#e8e8e8 gui=italic  

" Matching pairs
hi MatchParen guibg=#A2CF33 guifg=black gui=bold

hi Pmenu	guibg=darkgrey guifg=grey80
hi PmenuSel	guibg=orangered guifg=white

" My own CF-specific shit.

hi link 	cfCommentDelSL		cfCommentDel
hi link 	cfCommentDelML		cfCommentDel
hi link 	cfCommentCustSL		cfCommentTodoExtras
hi link 	cfCommentCustML		cfCommentTodoExtras
hi link 	cfCommentTodoSLA	cfCommentCustom
hi link 	cfCommentTodoSLT	cfCommentCustom
hi link 	cfCommentTodoMLA	cfCommentCustom
hi link 	cfCommentTodoMLT	cfCommentCustom

"syn region	cfCommentDelSL	contained	start="\$\$\$"	end="\n"
"syn region	cfCommentDelML	contained	start="\$\$\$-"	end="-\$\$\$"
"syn cluster	cfCommentDel	contains=cfCommentDelSL,cfCommentDelML
"
"syn region	cfCommentCustSL	contained	start="\*\*\*[^-]"	end="\n"
"syn region	cfCommentCustML	contained	start="\*\*\*-"		end="-\*\*\*"
"syn cluster	cfCommentCust	contains=cfCommentCustSL,cfCommentCustML
"
"syn region	cfCommentTodoSLA	contained	start="@@@[^-]"		end="\n"
"syn region	cfCommentTodoSLT	contained	start="TODO[^-]"	end="\n"
"syn region	cfCommentTodoMLA	contained	start="@@@-"		end="-@@@"
"syn region	cfCommentTodoMLT	contained	start="TODO-"		end="-TODO"

hi cfCommentDel	guibg=#EFECD1 guifg=#DF6237
hi cfCommentCustom guibg=#EFECD1 guifg=#2B5BAF
hi cfCommentTodoExtras guibg=#EFECD1 guifg=#2B5BAF

" Here is some cool diff stuff, too.
hi DiffAdd guibg=#AADF99
hi DiffChange guibg=#A7BBDF
hi DiffDelete guibg=#DFA599
hi DiffText guibg=#E9C2EF
