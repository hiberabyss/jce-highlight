"============================================================================
"File:        jce2cpp.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  tenfyzhong <tenfyzhong@tencent.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_jce_jce2cpp_checker')
    finish
endif
let g:loaded_syntastic_jce_jce2cpp_checker = 1

if !exists(':SyntasticCheck')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

" function! SyntaxCheckers_jce_jce2cpp_IsAvailable() dict
"     return executable(self.getExec())
" endfunction

function! SyntaxCheckers_jce_jce2cpp_GetHighlightRegex(i)
    " if stridx(a:i['text'], 'assigned but unused variable') >= 0
    "     let term = split(a:i['text'], ' - ')[1]
    "     return '\V\<' . escape(term, '\') . '\>'
    " endif

    " return ''
    let tokenbeg = stridx(a:i['text'], "'")
    if tokenbeg == -1 
        return ''
    endif
    let tokenbeg += 1
    let tokenend = stridx(a:i['text'], "'", tokenbeg)
    if tokenend == -1
        return ''
    endif
    let tokenend -= 1
    return '\V\<' . escape(a:i['text'][tokenbeg : tokenend], '\') . '\>'
endfunction

function! SyntaxCheckers_jce_jce2cpp_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ 'args': '--pdu'})

    let errorformat =
                \ '%f: %l: %trror: %m'

    let env = {}

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'env': env })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'jce',
    \ 'name': 'jce2cpp',
    \ 'exec': 'jce2cpp'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
