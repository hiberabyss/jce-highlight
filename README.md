jce-highlight
=============

jce语法高亮  


# 安装说明
## vundle
.vimrc 下加入以下的语句
<pre><code>Bundle 'tenghui0425/jce-highlight'</code></pre>

## 不使用vundle
<pre><code>
git clone https://github.com/tenghui0425/jce-highlight.git
</code></pre>
然后将syntax目录移到.vim下  


# .vimrc配置
<pre><code>
    augroup jcefile  
        au! BufRead,BufNewFile *.jce setfiletype jce  
        au! BufRead,BufNewFile *.jce set syntax=jce  
    augroup end  
</code></pre>
