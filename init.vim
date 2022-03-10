" vim:ft=vim:ts=4:sw=0
if has('win32')
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
endif
if has('termguicolors')
	set termguicolors
endif
syntax enable
set background=dark
let g:everforest_background = 'hard'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 0
" colorscheme everforest
" colorscheme afterglow
" colorscheme nord
" colorscheme dracula
colorscheme OceanicNext


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

" spelling
set spelllang=en,ru
set nospell

" list characters
set list
set listchars=tab:┃\ ,space:·,trail:␣,eol:↓,nbsp:·

runtime autocmds.vim
runtime maps.vim
lua require "init"
