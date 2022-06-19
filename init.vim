" vim:ft=vim:ts=4:sw=0
lua require'impatient'
syntax enable
let base16colorspace=256
set background=dark
" gruvbox-material
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_ui_contrast = 'high'
" github
let g:github_dark_float = 1
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer", "nvimtree"]
let g:github_hide_inactive_statusline = 1
let g:github_keyword_style = 'bold'
let g:github_comment_style = 'none'
let g:github_transparent = 1
" moonfly
let g:moonflyWinSeparator = 2
" material
let g:material_style = "darker"

function! CheckHost(hostname)
	return match(system("echo -n $HOST"), a:hostname) >= 0
endfunction

if has('termguicolors')
	set termguicolors
endif


" colorscheme codedark
colorscheme material
if has('win32')
	let &shell='C:/Users/fedin/AppData/Local/Microsoft/WindowsApps/Microsoft.PowerShell_8wekyb3d8bbwe/pwsh.exe'
	let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	set shellquote= shellxquote=
	let &shellcmdflag='-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
	set fileformat=unix
endif

let mapleader=' '

" indents
set tabstop=4
set shiftwidth=0
set expandtab
set smartindent

set nowrap
set completeopt=menu,menuone,noselect
set title
set clipboard+=unnamed,unnamedplus
set cmdheight=1
set number relativenumber
set hidden
set mouse=a
set colorcolumn=81 " draw line after 80 characters

" splitting
set splitbelow splitright
set undofile

" searching
set ignorecase
set smartcase
nnoremap <silent> <leader>/ <cmd>nohl<CR>

" spelling
set spelllang=en,ru
set nospell

" fill characters
set fillchars=horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┨,vertright:┣,verthoriz:╋
" list characters
set list listchars=tab:\ ,space:·,trail:■,eol:﬋,nbsp:␣
set showbreak=↪\
" Make cursor a line in insert
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Russian language
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Autopairs
let g:AutoPairs = {
	\ '(':')',
	\ '[':']',
	\ '{':'}',
	\ "'":"'",
	\ '"':'"',
	\ '`':'`',
	\ '<':'>',
	\ }
runtime autocmds.vim
runtime maps.vim
runtime menu_highlight.vim
runtime neovide.vim
runtime spell.vim
lua require "init"
