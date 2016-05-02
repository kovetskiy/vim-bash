if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C

setlocal commentstring=#%s

" Shell:  thanks to Johannes Zellner
if exists("loaded_matchit")
    let s:sol = '\%(;\s*\|^\s*\)\@<='  " start of line
    let b:match_words =
    \ s:sol.'if\>:' . s:sol.'elif\>:' . s:sol.'else\>:' . s:sol. 'fi\>,' .
    \ s:sol.'\%(for\|while\)\>:' . s:sol. 'done\>,' .
    \ s:sol.'case\>:' . s:sol. 'esac\>'
endif

" Undo the stuff we changed.
let b:undo_ftplugin = "setlocal cms< | unlet! b:browsefilter b:match_words"

" Restore the saved compatibility options.
let &cpo = s:save_cpo
unlet s:save_cpo
