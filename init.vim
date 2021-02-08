set relativenumber
set directory=~/.swap
set nocp
set nu
syntax on
set ignorecase smartcase
set wrapscan
set tabstop=4
set shiftwidth=4
set clipboard+=unnamedplus
set ff=unix
set termencoding=utf-8
set encoding=utf-8
set cursorline
autocmd FileType json,markdown let g:indentLine_conceallevel=0
"------------ coc.nvim recommand --------------------
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

"---------------------------------------
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

"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"--------------- For markdown --------------------------------
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
"----------------------------------------------------------
call plug#end()
" ---------coc plugin-------------
let g:coc_node_path='~/.local/myvim/bin/node'
"let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-highlight','coc-pyright','coc-tabnine','coc-xml','coc-yaml','coc-clangd']
let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-highlight','coc-pyright','coc-tabnine','coc-xml','coc-yaml','coc-clangd','coc-snippets']
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
inoremap {<Enter> {<Enter>}<ESC>O

"---------------------------------------------------------------------------

"----------- nerd tree ----------------------
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
"---------------------------------------------------------------------------

" jj 退出 insert mode
inoremap jj <Esc>

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
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"--------------for markdown ----------------
let g:mkdp_auto_close = 0
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:mkdp_open_to_the_world = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
autocmd FileType markdown nmap <C-s> <Plug>MarkdownPreview
autocmd FileType markdown nmap <C-d> <Plug>MarkdownPreviewStop
autocmd FileType markdown inoremap <C-b> ****<Esc>hi
autocmd FileType markdown nmap <F9> :s/$/<Space><Space>/g<CR>:noh<CR>
autocmd FileType markdown vmap <F9> :s/$/<Space><Space>/g<CR>:noh<CR>

