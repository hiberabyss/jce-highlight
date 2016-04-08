" Vim syntax file
" Language: jce
" Maintainer: tenfyzhong

if version < 600
    syntax clear
elseif exists("b:current_syntax") 
    finish
endif

syn case match

syn keyword jceTodo         TODO todo Todo contained 
syn keyword jceBug          BUG bug Bug ERROR error Error contained
syn cluster jceState        contains=jceTodo,jceBug
syn keyword jceStructure    module struct enum interface
syn keyword jceType         void bool byte short int double float long string vector map unsigned
syn keyword jceBool         true false
syn keyword jceOption       require optional
syn keyword jceLabel        out
syn keyword jceStatement    const key routekey
syn keyword jceCpp03Keyword asm auto break case catch class const_cast continue default delete do dynamic_cast else explicit export extern for friend goto if inline mutable namespace new operator private protected public register reinterpret_cast return signed sizeof static static_cast switch template this throw try typedef typeid typename union using virtual void volatile wchar_t while
syn keyword jceCpp11Keyword alignas constexpr char16_t char32_t decltype nullptr noexcept static_assert 
syn keyword jceC99Keyword   restrict _Bool _Complex _Imaginary
syn keyword JceC11Keyword   _Alignas _Alignof _Atomic _Static_assert _Noreturn _Thread_local _Generic

"integer number, or floating point number without a dot and with "f".  syn case ignore
syn match	jceNumbers	display transparent "\<\d\|\.\d" contains=jceNumber,jceFloat,jceOctalError,jceOctal
" Same, but without octal error (for comments)
syn match	jceNumbersCom	display contained transparent "\<\d\|\.\d" contains=jceNumber,jceFloat,jceOctal
syn match	jceNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	jceNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	jceOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=jceOctalZero
syn match	jceOctalZero	display contained "\<0"
syn match	jceFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	jceFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	jceFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	jceFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

syn region  jceBlock    start="{" end="}" transparent fold
" comment
syn region jceCommentL	start="//" skip="\\$" end="$" keepend contains=@jceState
syn region jceComment   start=/\/\*/ end=/\*\// contains=@jceState

syn region	jceIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	jceIncluded	display contained "<[^>]*>"
syn match	jceInclude	display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=jceIncluded

syn region  jceString   start=/"/ skip=/\\"/ end=/"/

highlight default link jceTodo         Todo
highlight default link jceBug          Error
highlight default link jceInclude      Include
highlight default link jceStructure    Structure
highlight default link jceOption       Repeat
highlight default link jceType         Type
highlight default link jceBool         Boolean
highlight default link jceLabel        Type
highlight default link jceStatement    Statement
highlight default link jceNumbers      Number
highlight default link jceNumbersCom   Number
highlight default link jceNumber       Number
highlight default link jceOctal        Number
highlight default link jceOctalZero    Error
highlight default link jceFloat        Float
highlight default link jceComment      Comment
highlight default link jceCommentL     Comment
highlight default link jceString       String
highlight link jceCpp03Keyword     Error
highlight link jceCpp11Keyword     Error
highlight link jceC99Keyword       Error
highlight link jceC11Keyword       Error

syn sync fromstart

let b:current_syntax="jce"

