call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
call plug#end()

syntax on
colorscheme onedark

set relativenumber

set encoding=UTF-8
set termguicolors

set hlsearch
set incsearch
set ignorecase
set smartcase

set ts=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set splitbelow splitright
set nowrap

set hidden
set title
set noshowmode
set mouse=a
set updatetime=100
set scrolloff=5
set cursorline

"======================== REMAP =============================
inoremap jk <esc>

nnoremap <space>w :w<cr>
nnoremap <space>q :q<cr>
nnoremap <space>t cit
nnoremap <space>' ci"

nnoremap ff :Prettier<cr>

nnoremap J 5j
nnoremap K 5k
nnoremap L $
nnoremap H ^

"==================== AIRLINE =========================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'

"====================== NERDTree ===========================
nnoremap <C-e> :NERDTreeFocus<CR>
nnoremap <C-d> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"===================== CTRLP ===================
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"===================== INDENTLINE ===========================
let g:indentLine_enabled = 1

"======================== COC =============================
let g:coc_global_extensions = ['coc-css', 'coc-cssmodules', 'coc-docker', 'coc-emmet', 'coc-html', 'coc-html-css-support', 'coc-json', 'coc-prettier', 'coc-snippets', 'coc-tsserver', 'coc-styled-components', 'coc-sql']

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-space> coc#refresh()

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>x  <Plug>(coc-convert-snippet)

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
