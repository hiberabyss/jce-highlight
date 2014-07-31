jce-highlight
=============

jce语法高亮  


# 安装说明
## vundle
.vimrc 下加入以下的语句
    Bundle 'tenghui0425/jce-highlight'  
    augroup filetype  
        au! BufRead,BufNewFile *.jce setfiletype jce  
    augroup end  

## 不使用vundle
git clone https://github.com/tenghui0425/jce-highlight.git  
然后将syntax目录移到.vim下  
