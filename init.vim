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
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'dominikduda/vim_current_word'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
if executable('ctags')
	Plug 'ludovicchabant/vim-gutentags'
endif
call plug#end()

" ---------coc plugin-------------
"let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-clangd','coc-python','coc-highlight']
let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-highlight','coc-pyright','coc-tabnine','coc-xml','coc-yaml','coc-clangd']
"  ----------------------------
" -------- enable rainbow --------
let g:rainbow_active = 1
" -------------------------------

" ------------ color scheme --------
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_light="medium"
set bg=dark
"----------------------------------------
"------------auto-pairs
"
let g:AutoPairsMapCh = 0
"----------------------------------------

"------------ gutentags --------------------
if executable('ctags')

	" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
	let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

	" 所生成的数据文件的名称 "
	let g:gutentags_ctags_tagfile = '.tags'

	" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
	let s:vim_tags = expand('~/.cache/tags')
	let g:gutentags_cache_dir = s:vim_tags
	" 检测 ~/.cache/tags 不存在就新建 "
	if !isdirectory(s:vim_tags)
	   silent! call mkdir(s:vim_tags, 'p')
	endif

	" 配置 ctags 的参数 "
	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


	"For C++ STL
	set tags+=/usr/include/c++/stl.tags
	"For C++ ROS
	set tags+=/opt/ros/ros.tags
	set statusline+=%{gutentags#statusline()}
	let g:gutentags_defined_advanced_commands = 1
endif
"---------------------------------------------------------------------------

"-------------auto completion ---------------------------------------------

" 使用ctrl+空格键来强制触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 自动补全快捷键修改
inoremap <expr> <A-k> ((pumvisible())? ("\<C-p>"):(""))
inoremap <expr> <A-j> ((pumvisible())? ("\<C-n>"):(""))
"inoremap <expr> [ ((pumvisible())? ("\<C-p>"):("["))
"inoremap <expr> ] ((pumvisible())? ("\<C-n>"):("]"))
inoremap <expr> \ ((pumvisible())? ("\<C-e>"):("\\"))
inoremap <expr> <TAB> ((pumvisible())? ("\<C-y>"):("\<TAB>"))
inoremap <expr> <Enter> ((pumvisible())? ("\<C-e>\<Enter>"):("\<CR>"))
inoremap { {<Enter>}<ESC>O
"inoremap < <><ESC>i


"---------------------------------------------------------------------------

"----------- nerd tree ----------------------
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
"---------------------------------------------------------------------------

" jj 退出 insert mode
inoremap jj <Esc>

" 函数跳转
map <c-]> g<c-]>
inoremap oo <Esc>o
inoremap OO <Esc>O
inoremap AA <Esc>A
inoremap II <Esc>I
inoremap <C-h> <C-O>h
inoremap <C-j> <C-O>j
inoremap <C-k> <C-O>k
inoremap <C-l> <ESC>la
" 取消搜索的高亮（一次）
nnoremap <F3> :noh<CR>
"--------------hightlight current words

let g:vim_current_word#enable = 1
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 0

"---------------------------------------------------------------------------

"-----------------------other -------------------------------------------------
inoremap \nn <ESC>o
"nnoremap <C-'> o<ESC>
"------------------------------------------------------------------------

