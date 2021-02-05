set relativenumber
set directory=~/.swap
set nocp
set nu
syntax on
set ignorecase smartcase
set wrapscan
set tabstop=4
set shiftwidth=4
set nobackup
set nowritebackup
set clipboard+=unnamedplus
set ff=unix
set cursorline
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'dominikduda/vim_current_word'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
call plug#end()
" ---------coc plugin-------------
let g:coc_node_path='~/.local/myvim/bin/node'
let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-highlight','coc-pyright','coc-tabnine','coc-xml','coc-yaml','coc-clangd']
"  ----------------------------
" -------- enable rainbow --------
let g:rainbow_active = 1
" -------------------------------
" ------------ color scheme --------
set termguicolors
colorscheme gruvbox
"colorscheme dracula
let g:gruvbox_contrast_light="medium"
set bg=dark
"----------------------------------------
"------------auto-pairs
"
let g:AutoPairs={'(':')', '[':']',"'":"'",'"':'"', "`":"`", '```':'`````', '"""':'"""""', "'''":"'''''"}
let g:AutoPairsMapCh = 0
"----------------------------------------

"-------------auto completion ---------------------------------------------

" 使用ctrl+空格键来强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 自动补全快捷键修改
inoremap <expr> <A-k> ((pumvisible())? ("\<C-p>"):(""))
inoremap <expr> <A-j> ((pumvisible())? ("\<C-n>"):(""))
inoremap <expr> \ ((pumvisible())? ("\<C-e>"):("\\"))
inoremap <expr> <TAB> ((pumvisible())? ("\<C-y>"):("\<TAB>"))
inoremap <expr> <Enter> ((pumvisible())? ("\<C-e>\<Enter>"):("\<CR>"))
inoremap { {<Enter>}<ESC>O

"---------------------------------------------------------------------------

"----------- nerd tree ----------------------
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
"---------------------------------------------------------------------------

" jj 退出 insert mode
inoremap jj <Esc>

" 函数跳转
map <c-]> g<c-]>
"inoremap oo <Esc>o
inoremap \nn <ESC>o
inoremap OO <Esc>O
inoremap AA <Esc>A
inoremap II <Esc>I
inoremap <C-h> <C-O>h
inoremap <C-j> <C-O>j
inoremap <C-k> <C-O>k
inoremap <C-l> <ESC>la

" 取消搜索的高亮（一次）
nnoremap <F3> :noh<CR>
nmap ycp yy\ccp
"--------------hightlight current words
let g:vim_current_word#highlight_current_word = 0
"---------------------------------------------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

