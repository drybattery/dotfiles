scriptencoding utf-8

function! Make(...)
	let l:command = 'make'
	if a:0 > 0
		for l:i in a:000
			let l:tmp     = ' '.l:i
			let l:command = l:command.l:tmp
		endfor
	endif
	if findfile('GNUmakefile',getcwd()) !=# '' || findfile('Makefile',getcwd()) !=# ''
		exe l:command
	elseif findfile('GNUmakefile',getcwd().'/../') !=# '' || findfile('Makefile',getcwd().'/../') !=# ''
		cd ../
		exe l:command
		cd -
	else
		echo 'Makefileが存在しません.'
	endif
endfunction
command! -nargs=* Make call Make(<f-args>)


function! AppendChar(arg)
	let l:text = a:arg
	if l:text ==# ''
		let l:text = ';'
	endif
	let l:pos = getpos('.')
	exe ':normal A'.l:text
	call setpos('.', l:pos)
endfunction
command! -nargs=+ AppendChar call AppendChar(<f-args>)


function! PyPlot(...)
	if expand('%:e') ==# 'txt'
		if a:0 == 0
			let l:column = ' -u1'
		elseif a:0 == 1
			let l:column = ' -u'.a:1
		elseif a:0 >= 2
			let l:column = ' -n'.a:0
			for l:i in a:000
				let l:tmp  = ' -u'.l:i
				let l:column = l:column.l:tmp
			endfor
		endif
		exe ':!pyplot %'.l:column
	endif
endfunction
command! -nargs=* PyPlot call PyPlot(<f-args>)


function! GnuPlot(arg1)
	if expand(a:arg1.':e') ==# 'gp' || expand(a:arg1.':e') ==# 'gpi'
		let l:command = ':!gnuplot '.a:arg1
		exe l:command
	else
		echo 'invalid file type.'
	endif
endfunction
command! -nargs=+ GnuPlot call GnuPlot(<f-args>)


if executable('pdftotext')
    command! -complete=file -nargs=1 Pdf :r !pdftotext -nopgbrk -layout <q-args> -
endif


function! Tex()
	if expand('%:e') ==# 'tex'
		let l:command = ':!platex '.expand('%')
		let l:command = l:command.'>& /dev/null && '
		let l:dvi = expand('%:r').'.dvi'
		if findfile(l:dvi,getcwd()) !=# ''
			let l:command = l:command.'open -a Skim '
			exe l:command.dvi
		endif
		let l:aux = expand('%:r').'.aux'
		let l:log = expand('%:r').'.log'
		if findfile(l:aux,getcwd()) !=# ''
			call delete(l:aux)
		endif
		if findfile(l:log,getcwd()) !=# ''
			call delete(l:log)
		endif
	else
		echo 'invalid file type.'
	endif
endfunction
command! Tex call Tex()


function! RangeChooser()
    let l:temp = tempname()
    " The option '--choosefiles' was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    " exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has('gui_running')
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(l:temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(l:temp)
    endif
    if !filereadable(l:temp)
        redraw!
        ' Nothing to read.
        return
    endif
    let l:names = readfile(l:temp)
    if empty(l:names)
        redraw!
        ' Nothing to open.
        return
    endif
    ' Edit the first item.
    exec 'edit ' . fnameescape(l:names[0])
    ' Add any remaning items to the arg list/buffer list.
    for l:name in l:names[1:]
        exec 'argadd ' . fnameescape(l:name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()


function! SetHlsearch()
	if &hlsearch
		set nohlsearch
	else
		set hlsearch
	endif
endfunction

