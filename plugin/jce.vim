augroup jcefile
    au!
    au BufRead,BufNewFile *.jce set filetype=jce
    au BufRead,BufNewFile *.jce setfiletype jce
    au BufRead,BufNewFile *.jce set syntax=jce
augroup end
