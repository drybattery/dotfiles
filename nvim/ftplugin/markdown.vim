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
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = '~/dotfiles/preview/css/github_style.css'
" let g:previm_disable_default_js = 1
" let g:previm_custom_js_path = '~/dotfiles/preview/js/previm.js'
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
"" bold (強調表示)
nno <silent><nowait> <leader>b :<C-u>call <SID>surround('**')<CR>
vno <silent><nowait> <leader>b :<C-u>call <SID>vsurround('**')<CR>
"" line (打ち消し線)
vno <silent><nowait> <leader>l :<C-u>call <SID>vsurround('\~\~')<CR>
"" under line (下線)
vno <silent><nowait> <leader>u :<C-u>call <SID>vunderline()<CR>


" function
fun!  s:surround(char) abort
    " カーソル下の単語をa:charで囲む関数
    if getline('.') !=# ''
        let l:pos = getcurpos()
        let l:word = expand('<cword>')
        exe line('.').'s/'.l:word.'/'.a:char.l:word.a:char
        call setpos('.', l:pos)
    endif
endf

fun!  s:vsurround(char) abort range
    " 選択範囲をa:charで囲む関数
    if getline('.') !=# ''
        let l:pos = getcurpos()
        let @@ = ''
        exe 'silent normal gvy'
        if @@ !=# ''
            let l:word = join(split(@@,'\n'))
        else
            let l:word = expand('<cword>')
        endif
        exe line('.').'s/'.l:word.'/'.a:char.l:word.a:char
        call setpos('.', l:pos)
    endif
endf

fun!  s:vunderline() abort range
    " 選択範囲を<u>...</u>で囲む関数
    if getline('.') !=# ''
        let l:pos = getcurpos()
        let @@ = ''
        exe 'silent normal gvy'
        if @@ !=# ''
            let l:word = join(split(@@,'\n'))
        else
            let l:word = expand('<cword>')
        endif
        exe line('.').'s/'.l:word.'/'.'<u>'.l:word.'<\/u>'
        call setpos('.', l:pos)
    endif
endf
