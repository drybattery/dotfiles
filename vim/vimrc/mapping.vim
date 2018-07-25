scriptencoding utf-8
"Key-mappings

let g:mapleader = "\<Space>"

nno <silent>> :bnext<CR>
nno <silent>< :bprevious<CR>
nno <silent>+ :res +1<CR>
nno <silent>- :res -1<CR>

ino <C-h> <Left>
ino <C-j> <Down>
ino <C-k> <Up>
ino <C-l> <Right>

nno <silent>j gj
nno <silent>k gk
nno <S-h>   ^
nno <S-j>   10j
nno <S-k>   10k
nno <S-l>   $

nno x "_x
vno x "_x

" noremap <C-w> <C-w>w

nno <silent>q :q<CR>
nno <silent>Q :qall<CR>
" nno <Enter> o<ESC>
ino {<Enter> {}<Left><CR><Up><ESC>$i<Right>
" ino {<Enter> {}<Left><CR><ESC>O
nno <silent>e     :e!<CR>
nno <silent>sh    :!:<CR>
nno <silent>sc    :source ~/.vimrc<CR>

ino … <ESC>:AppendChar<Space>;<CR>i<Right>
nno …      :AppendChar<Space>;<CR>
nno <silent>_     :TComment<CR>
vno <silent>_     :TComment<CR>
nno <silent><C-n> :NERDTreeToggle<CR>
nno <silent><C-o> :Unite outline<CR>
nno <silent><C-p> :PyPlot<CR>
nno <silent>ma    :Make all<CR>
nno <silent>mr    :Make build run<CR>
nno <silent><C-g> :GnuPlot %<CR>
nno <leader>r     :<C-U>RangerChooser<CR>
nno <leader>j     :!chrome_scroll next<CR><CR>
nno <leader>k     :!chrome_scroll previous<CR><CR>
nno <silent>?     :call SetHlsearch()<CR>
