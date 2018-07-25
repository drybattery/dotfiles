scriptencoding utf-8
" plugin settings

" NERDTree
let g:NERDTreeWinSize = 15
" PyFlake
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
" syntastic
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++14 -stdlib=libc++ -I/opt/local/include -I/Users/suzukisohei/Library/root_6_06/include'
" indent guide
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0
" hi IndentGuidesOdd  guibg=#113344
" hi IndentGuidesEven guibg=#223344
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#113344 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#223344 ctermbg=darkgray
" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    " let g:airline_left_sep          = '▶'
    let g:airline_left_sep          = ''
    let g:airline_left_alt_sep      = '»'
    " let g:airline_right_sep         = '◀'
    let g:airline_right_sep         = ''
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

