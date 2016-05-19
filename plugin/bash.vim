func! s:set_ft()
    setlocal ft=sh
    setlocal iskeyword+=:
    setlocal iskeyword+=-
endfunc!

func! s:set_ft_if_shebang()
    if getline(1) == "#!/bin/bash"
        call s:set_ft()
    endif
endfunc!

augroup vim_bash
    au!
    au BufNewFile,BufRead *.sh call s:set_ft()
    au BufNewFile,BufRead *.bash call s:set_ft()
    au BufNewFile,BufRead * call s:set_ft_if_shebang()
augroup end
