scriptencoding utf-8
"*****************************************************************************
"" Key-Mappings
"*****************************************************************************
let g:mapleader = "\<Space>"

" general
tno <silent> <C-[> <C-\><C-n>
nno <silent> ; :
ino <silent> <C-s>   <ESC>:w<CR>a
nno <silent> <C-s>   :w<CR>
nno <silent> q       :CloseBufferTab<CR>
nno <silent> <S-q>   :qall<CR>
tno <silent> <C-w>   <C-\><C-n><C-w>
ino <silent> <C-j>   <ESC>o

" tab/window
nno <silent> <Tab>   :ChangeBuffer next<CR>
nno <silent> <S-Tab> :ChangeBuffer previous<CR>
nno <silent> >       :ChangeBuffer next<CR>
nno <silent> <       :ChangeBuffer previous<CR>
nno <silent> +       :ResizeWindow +1<CR>
nno <silent> -       :ResizeWindow -1<CR>

" yank/delete/paste
vno <silent> p       "0p
nno <silent> x       "_x
vno <silent> x       "_x
nno <silent> D       "_D
nno <silent> de      "_de

" cursor move
nno <silent> j       gj
nno <silent> k       gk
ino <silent> <C-h>   <Left>
ino <silent> <C-l>   <Right>
nno <silent> <S-h>   ^
nno <silent> <S-j>   5gj
nno <silent> <S-k>   5gk
nno <silent> <S-l>   $
vno <silent> <S-h>   ^
vno <silent> <S-j>   5gj
vno <silent> <S-k>   5gk
vno <silent> <S-l>   $
if system('uname') ==# "Linux\n"
    ino <silent> <A-h> <Left>
    ino <silent> <A-j> <Down>
    ino <silent> <A-k> <Up>
    ino <silent> <A-l> <Right>
endif

" for IME
nno <silent> あ      a
nno <silent> い      i
nno <silent> う      u
nno <silent> お      o
nno <silent> ｒ      r
nno <silent> ｊ      gj
nno <silent> ｋ      gj
nno <silent> ｌ      l
nno <silent> ｈ      h
nno <silent> ｐ      p
nno <silent> ｄｄ    dd
nno <silent> ｙｙ    yy

"" Mapping for Plugins
if has('mac')
    nno <silent> _     :TComment<CR>
    vno <silent> _     :TComment<CR>
else
    nno <silent> \     :TComment<CR>
    vno <silent> \     :TComment<CR>
endif
nno <silent> <C-b> :Buffers<CR>
nno <silent> <C-f> :Find<CR>
nno <silent> <C-h> :call Ranger()<CR>
nno <silent> <C-n> :NERDTreeToggle<CR>
nno <silent> <C-t> :TagbarToggle<CR>
nno <silent> <C-g> :exe 'Ag '.expand('<cword>')<CR>
nno <silent> [a    :ALENextWrap<CR>
nno <silent> ]a    :ALEPreviousWrap<CR>
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>       <Plug>(neosnippet_expand_or_jump)
smap <C-k>       <Plug>(neosnippet_expand_or_jump)
xmap <C-k>       <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable()?
                 \"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" mapping for My Commands
if has('mac')
    ino <silent> …       <ESC>:Appendchar ;<CR>a
    no  <silent> …            :Appendchar ;<CR>
else
    ino <silent> <A-;>    <ESC>:Appendchar ;<CR>a
    no  <silent> <A-;>         :Appendchar ;<CR>
endif
nno <silent> ?          :call SetHlsearch()<CR>
nno <silent> t          :SplitTerm<CR>i
" nno <silent> <leader>g  :Fgrep<CR>
nno <silent> <leader>ma :Make<CR>
nno <silent> <leader>mr :Make build run<CR>
nno <silent> <leader>cm :CMake<CR>
nno <silent> <leader>cr :CMake run<CR>
nno <silent> <leader>sq :SQL<CR>i
