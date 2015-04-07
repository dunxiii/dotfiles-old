set number
set dictionary+=/usr/share/dict/words
"set tabstop=4

syntax on

"Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null % | :edit!
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


"" LaTex
"filetype plugin on
"set grepprg=grep\ -nH\ $*
"filetype indent on
"let g:tex_flavor='latex'
