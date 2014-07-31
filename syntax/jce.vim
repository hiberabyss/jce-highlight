" Vim syntax file
" Language: jce
" Maintainer: tenfyzhong

if version < 600
    syntax clear
elseif exists("b:current_syntax") 
    finish
endif

syn case match

syn keyword jceTodo contained TODO todo Todo
syn keyword jceStructure    module struct enum interface
syn keyword jceType         void bool byte short int double float long string vector map unsigned key
syn keyword jceBool         true false
syn keyword jceOption       require optional
syn keyword jceParamOption  out

setlocal iskeyword+=#
syn keyword jceInclude      #include
syn match jceUnderline      "_"

hi def link jceTodo         Todo
hi def link jceInclude      Include
hi def link jceStructure    Structure
hi def link jceOption       Repeat
hi def link jceType         Type
hi def link jceBool         Boolean
hi def link jceParamOption  Type
hi def link jceUnderline    Error

let b:current_syntax="jce"
