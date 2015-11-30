au BufRead,BufNewFile *.jce set filetype=jce
au BufRead,BufNewFile *.jce set syntax=jce
au FileType jce setlocal foldmethod=expr
au FileType jce setlocal foldexpr=fold#BraceFoldExpr(v:lnum)
