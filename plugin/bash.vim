func! s:set_bash()
    setlocal ft=bash
    setlocal iskeyword+=:
endfunc!

func! s:set_bash_if_sh()
    if line(1) == "#!/bin/bash"
        call s:set_bash()
    endif
endfunc!

augroup vim_bash
    au!
    au BufNewFile,BufRead *.sh call s:set_bash()
    au BufNewFile,BufRead *.bash call s:set_bash()
augroup end

augroup vim_sh_to_bash
    au!
    au FileType sh call s:set_bash_if_sh()
augroup end
