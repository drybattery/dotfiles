scriptencoding utf-8
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/unite.vim')
	call dein#add('Shougo/unite-outline')
	call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
	call dein#add('scrooloose/syntastic')
	call dein#add('landaire/deoplete-swift')
	call dein#add('thinca/vim-quickrun')
	call dein#add('tomtom/tcomment_vim')
	call dein#add('scrooloose/nerdtree')
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('vim-jp/cpp-vim')
    call dein#add('ap/vim-buftabline')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	" for swift
	call dein#add('keith/swift.vim')
	" for python
	call dein#add('hynek/vim-python-pep8-indent')
	call dein#add('Townk/vim-autoclose')
	call dein#add('vim-scripts/Flake8-vim')
	" for applescript
	call dein#add('vim-scripts/applescript.vim')

	" You can specify revision/branch/tag.
	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

"dein Settings-----------------------------
