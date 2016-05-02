func! s:set_bash()
    setlocal ft=bash
    setlocal iskeyword+=:
endfunc!

augroup vim_bash
    au!
    au BufNewFile,BufRead *.sh call s:set_bash()
augroup end
