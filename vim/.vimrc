scriptencoding utf-8
" filetype settings
filetype on
filetype plugin on

syntax on
" set termguicolors " for iTerm2

set hlsearch
" set incsearch

set number
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set virtualedit=onemore

" set encoding=utf-8
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" set fileformats=unix,dos,mac

set mouse=a

set laststatus=2

set smartindent
set tabstop=4
set shiftwidth=4
set scrolloff=3

set clipboard=unnamed

set path+=**
set wildmenu

" hightlight color
" hi matchparen ctermbg=236
" set list
" set listchars=tab:¦\ 
" hi SpecialKey guifg=#555555
" hi Visual guifg=#000000 guibg=#cceeff
hi matchparen ctermbg=236
hi Normal ctermbg=NONE guibg=NONE
" hi NonText ctermbg=NONE guibg=NONE
" hi SpecialKey ctermbg=NONE guibg=NONE
" hi EndOfBuffer ctermbg=NONE guibg=NONE
hi SpecialKey guifg=#555555
hi Visual guifg=#000000 guibg=#cceeff
hi LineNr guifg=#aabbcc guibg=#204056
hi VertSplit guifg=#10202b guibg=#aaaaaa
" hi CursorLine gui=underline
hi CursorLine guibg=#0c1820
" hi CursorColumn guibg=#0c1820
hi clear Cursor
hi Cursor gui=reverse
" hi clear Visual
hi Visual gui=reverse

" setting of python for neovim
let g:python2_host_prog = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python3'

" runtime of user vim settings (~/.vim/vimrc/*.vim)
ru! vimrc/*.vim

