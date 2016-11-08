" Vim syntax file
" Language: WACC

if exists("b:current_syntax")
  finish
endif

" Keywords

syn match WaccComment '#.*$'
syn keyword WaccConditional if then else fi
syn keyword WaccLoop while do done
syn keyword WaccType int bool char string pair
syn keyword WaccConstant true false null
syn region WaccString start=/\v"/ skip=/\v\\./ end=/\v"/
syn keyword WaccOperator len ord chr fst snd
syn keyword WaccKeywords begin end is call return print println newpair free exit skip read

let b:current_syntax = "wacc"

hi def link WaccComment Comment
hi def link WaccConditional Conditional
hi def link WaccLoop Repeat
hi def link WaccType Type
hi def link WaccConstant Constant
hi def link WaccString String
hi def link WaccOperator Operator
hi def link WaccKeywords Statement
