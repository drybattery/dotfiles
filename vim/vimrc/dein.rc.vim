scriptencoding utf-8
"-----------------------------------------------------------------------------
" dein.rc.vim:
"

" DeinClean command
command! -bang DeinClean call s:dein_clean(<bang>0)

function! s:dein_clean(force) abort "{{{
  let l:del_all = a:force
  for l:p in dein#check_clean()
    if !l:del_all
      let l:answer = s:input(printf('Delete %s ? [y/N/a]', fnamemodify(l:p, ':~')))

      if type(l:answer) is type(0) && l:answer <= 0
        " Cancel (Esc or <C-c>)
        break
      endif

      if l:answer !~? '^\(y\%[es]\|a\%[ll]\)$'
        continue
      endif

      if l:answer =~? '^a\%[ll]$'
        let l:del_all = 1
      endif
    endif

    " Delete plugin dir
    call dein#install#_rm(l:p)
  endfor
endfunction "}}}

function! s:input(...) abort "{{{
  new
  cnoremap <buffer> <Esc> __CANCELED__<CR>
  try
    let l:input = call('input', a:000)
    let l:input = l:input =~# '__CANCELED__$' ? 0 : l:input
  catch /^Vim:Interrupt$/
    let l:input = -1
  finally
    bwipeout!
    return l:input
  endtry
endfunction "}}}
