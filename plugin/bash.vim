func! s:set_bash()
    setlocal ft=bash
    setlocal iskeyword+=:
    setlocal iskeyword+=-
endfunc!

func! s:set_bash_if_shebang()
    if getline(1) == "#!/bin/bash"
        call s:set_bash()
    endif
endfunc!

augroup vim_bash
    au!
    au BufNewFile,BufRead *.sh call s:set_bash()
    au BufNewFile,BufRead *.bash call s:set_bash()
    au BufNewFile,BufRead * call s:set_bash_if_shebang()
augroup end
