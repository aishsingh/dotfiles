"
" Vim Color File
"
" Maintainer:	Aishwarya Singh (aishwarya_singh95@hotmail.com)
" Version:      1.0
" Last Change:  17 - Apr - 2014

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "deep"

" Main
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=236 ctermfg=NONE
hi LineNr				 ctermfg=241 ctermbg=237
hi CursorLineNr 		 ctermfg=234 ctermbg=37
hi Comment				 ctermfg=darkgrey
hi Statement			 ctermfg=grey
hi Visual				 ctermfg=black ctermbg=37 cterm=none
hi SpecialKey			 ctermfg=grey cterm=NONE
hi MatchParen			 ctermbg=magenta ctermfg=black cterm=BOLD
hi Pmenu				 ctermbg=237 ctermfg=grey 
hi PmenuSel				 ctermbg=magenta 
hi NonText				 ctermfg=darkgrey
hi SignColumn			 ctermbg=237
hi Folded				 ctermfg=245 ctermbg=237 cterm=none
hi FoldColumn			 ctermfg=251 ctermbg=237
hi VertSplit 			 ctermfg=black cterm=NONE
hi Constant				 ctermfg=9
hi Special				 ctermfg=8
hi Character			 ctermfg=blue
hi Number				 ctermfg=blue
hi Boolean				 ctermfg=blue
hi Float				 ctermfg=blue
hi String				 ctermfg=9
hi Directory			 ctermfg=blue
hi SpellBad				 ctermfg=white ctermbg=red
hi SpellCap				 ctermfg=black ctermbg=yellow
hi Search				 ctermfg=black ctermbg=yellow cterm=none
hi Identifier			 ctermfg=grey
hi PreProc               ctermfg=37 cterm=bold

" Startify
hi StartifyHeader		ctermfg=magenta
hi StartifyBracket		ctermfg=darkgrey
hi StartifyNumber		ctermfg=darkred
hi StartifySection		ctermfg=magenta
hi StartifyPath			ctermfg=darkgrey
hi StartifyFile			ctermfg=grey
hi StartifySlash		ctermfg=darkgrey
hi StartifySpecial		ctermfg=darkgrey

" TagBar
hi TagbarHighlight ctermfg=magenta ctermbg=233 cterm=none
hi TagbarKind	   ctermfg=blue
hi TagbarHelp 	   ctermfg=darkgrey
hi TagbarScope 	   ctermfg=grey

" Easymotion
hi EasyMotionTarget ctermbg=none ctermfg=blue
hi EasyMotionShade  ctermbg=none ctermfg=darkgrey
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

" Tag Highlighting
hi Member ctermfg=95
hi GlobalVariable ctermfg=white
hi Statement ctermfg=darkgrey
hi EnumeratorName ctermfg=darkgreen
hi EnumerationValue ctermfg=blue

" Mulitple cursors
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
