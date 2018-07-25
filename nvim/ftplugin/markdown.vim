scriptencoding utf-8
"*****************************************************************************
"" markdown ftplugin
"*****************************************************************************

" auto command
aug delimitMate
    if exists('delimitMate_version')
        au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    endif
aug END
" previm
aug PrevimSettings
    au!
    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    au BufWritePost *.{md,mdwn,mkd,mkdn,mark*} call previm#refresh()
aug END
fun! s:PrevimOpenCmd()
    if &filetype ==# 'markdown'
        if has('mac')
            exe 'PrevimOpen'
        elseif system('uname') ==# "Linux\n"
            let g:previm_custom_dir = $HOME.'/.config/nvim/plugged/previm/preview'
            let l:preview_html_file = 'C:/Users/user/AppData/Local/lxss'.g:previm_custom_dir.'/index.html'
            call previm#open(l:preview_html_file)
        else
            return
        endif
    endif
endf
command! Previm call s:PrevimOpenCmd()


" mapping
if has('mac')
    ino <silent><buffer> …     <ESC>:Appendchar \ \ <CR>a
    no  <silent><buffer> …          :Appendchar \ \ <CR>
elseif system('uname') ==# "Linux\n"
    ino <silent><buffer> <A-;> <ESC>:Appendchar \ \ <CR>a
    no  <silent><buffer> <A-;>      :Appendchar \ \ <CR>
endif
nno <silent><nowait> <leader>b :<C-u>call <SID>bold()<CR>


" function
fun!  s:bold() abort
    if getline('.') !=# ''
        let l:pos = getcurpos()
        let l:word = expand('<cword>')
        exe line('.').'s/'.l:word.'/'.'**'.l:word.'**'
        call setpos('.', l:pos)
    endif
endf
