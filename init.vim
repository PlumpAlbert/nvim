" vim:ft=vim:ts=4:sw=0
if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
colorscheme everforest

let mapleader=' '

" indents
set tabstop=4
set shiftwidth=0
set noexpandtab
set smartindent

set title
set clipboard+=unnamedplus
set cmdheight=1
set number relativenumber
set hidden
set mouse=a
set colorcolumn=80,100

" splitting
set splitbelow
set splitright
set undofile

" searching
set ignorecase
set smartcase
nnoremap <silent> <leader>/ <cmd>nohl<CR>

runtime autocmds.vim
runtime maps.vim
lua require "init"
