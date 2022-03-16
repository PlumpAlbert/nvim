" vim:ft=vim:ts=4:sw=0
syntax enable
set background=dark
let g:everforest_background = 'hard'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 0
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_ui_contrast = 'high'

if has('win32')
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
	let &shell='C:/Users/fedin/AppData/Local/Microsoft/WindowsApps/Microsoft.PowerShell_8wekyb3d8bbwe/pwsh.exe'
	let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	set shellquote= shellxquote=
	let &shellcmdflag='-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	" Theming
	let g:gruvbox_material_palette = 'mix'
	let g:gruvbox_material_transparent_background = 1
	colorscheme gruvbox-material
else
	" colorscheme everforest
	" colorscheme afterglow
	" colorscheme nord
	" colorscheme dracula
	" colorscheme gruvbox-material
	" colorscheme OceanicNext
	colorscheme github_dark_default
endif

if has('termguicolors')
	set termguicolors
endif


let mapleader=' '

" indents
set tabstop=4
set shiftwidth=0
set noexpandtab
set smartindent

set completeopt=menu,menuone,noselect
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
set listchars=tab:┃\ ,space:·,trail:■,eol:↲,nbsp:␣

runtime autocmds.vim
runtime maps.vim
runtime menu_highlight.vim
lua require "init"
