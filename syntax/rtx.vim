" Vim syntax file
" Language:     Apertium Recursive
" Maintainer:   Flammie A Pirinen <flammie@iki.fi>
" Last Change:  Sat, 12 Mar 2022 15:08:00 +0100
" URL: https://github.com/flammie/vim-apertium
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'rtx'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword     rtxKeyWords     and or equal issuffix isprefix issubstring
            \                   hasprefix hassuffix contains startswith endswith
            \                   if      contained

" Operator
syn match       rtxOper /[=;->.@,_|]/   display

" stuff
syn region      rtxOutput       start=/{/       end=/}/ contains=rtxOper,rtxKeyWords
syn region      rtxString       start=/"/       end=/"/ contained
syn match       rtxVariable     /[[:alnum:]]*/  display

" SpecialChar

" Comments
syn keyword     rtxCommentNotes TODO FIXME XXX  contained
syn match       rtxCommentInfos /@\w\+/ contained
syn match       rtxComment      /!.*/   contains=pmatchCommentNotes,pmatchCommentInfos

" Clusters, regions...

" Highlights
highlight def link      rtxKeyWords     Keyword
highlight def link      rtxOper         Operator
highlight def link      rtxString       String
highlight def link      rtxVariable     Identifier
highlight def link      rtxCommentInfos SpecialComment
highlight def link      rtxCommentNotes Todo
highlight def link      rtxComment      Comment

let b:current_syntax = "rtx"

if main_syntax == 'rtx'
  unlet main_syntax
endif

" vim: ts=8
