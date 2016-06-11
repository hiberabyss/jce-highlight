"==============================================================
"    file: jce-highlight.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 16:09:11
"==============================================================

if exists(":Tagbar")
    let g:tagbar_type_jce = {
                \ 'ctagstype'   : 'jce',
                \ 'kinds'       : [
                \ 'm:module',
                \ 's:struct',
                \ 'e:enum',
                \],
                \ 'sro'         : '::'
                \}
endif

function! s:GenJceTag(...)
    let l:pwd = getcwd()
    let l:path = l:pwd
    " if a:0 > 0
    "     let l:path = expand(a:1)
    " endif

    " if !isdirectory(l:path)
    "     l:path = l:pwd
    " endif

    cd l:path

    echom "l:pwd : " . l:pwd
    echom "l:path : " . l:path

    " let &cdpath = &cdpath . ',' . l:path

    call system("ctags --langdef=jce --langmap=jce:.jce --regex-jce='/^\s*module\s*([a-zA-Z_0-9]+)/\1/m,module/ --regex-jce='/^\s*struct\s*([a-zA-Z_0-9]+)/\1/s,struct/' --regex-jce='/^\s*enum\s*([a-zA-Z_0-9]+)/\1/s,struct/' -R")

    cd l:pwd
endfunction

command! -nargs=? -complete=dir GenJceTag call <SID>GenJceTag(<q-args>)
