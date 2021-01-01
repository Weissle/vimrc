set relativenumber
set directory=~/.swap
set nocp
syntax on
set tabstop=4
set shiftwidth=4

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" enable rainbow
let g:rainbow_active = 1



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
	  "\ pumvisible() ? "\<C-n>" :
	  "\ <SID>check_back_space() ? "\<TAB>" :
	  "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" 使用ctrl+空格键来强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 自动补全快捷键修改
"inoremap <expr> <C-i> ((pumvisible())? ("\<C-p>"):("\<C-"i>"))
"inoremap <expr> <C-k> ((pumvisible())? ("\<C-n>"):("k"))
inoremap <expr> \ ((pumvisible())? ("\<C-e>"):("\\"))
inoremap <expr> <TAB> ((pumvisible())? ("\<Enter>"):("\<CR>"))

" jj 退出 insert mode
inoremap jj <Esc>


" auto completion
"inoremap ' ''<ESC>i
"inoremap  ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
inoremap { {<Enter>}<ESC>O
inoremap < <><ESC>i
