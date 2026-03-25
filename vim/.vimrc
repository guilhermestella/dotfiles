" Leader
let mapleader = " "

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Editor
set mouse=a
set clipboard=unnamedplus
set undofile
set undodir=~/.vim/undo
set confirm
set autoread

" Files
set fileencoding=utf-8
set nobackup
set nowritebackup
set noswapfile

" UI
set updatetime=500
set termguicolors
set number
set relativenumber
set numberwidth=4
set nowrap
set breakindent
set showmode
set cmdheight=1
set colorcolumn=120
set linebreak
set shortmess+=I
let g:jellybeans_overrides = { 'background': { 'guibg': '060606' } }
colorscheme jellybeans

" Indentation
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4

" Keymaps
nnoremap <Esc> :nohlsearch<CR>
nnoremap <C-w>q :bdelete<CR>
nnoremap <M-k> :bprevious<CR>
nnoremap <M-j> :bnext<CR>
vnoremap < <gv
vnoremap > >gv

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Autocmds
augroup vimrc
    autocmd!
    autocmd BufReadPost * silent! normal! g`"zz
    autocmd BufWritePre * %s/\s\+$//e
augroup END
