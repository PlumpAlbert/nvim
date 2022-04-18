" vim:ft=vim:ts=4:sw=0
syntax enable
set background=dark
" everforest
let g:everforest_background = 'hard'
" OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 0
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
" solarized
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "low"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_termBoldAsBright = 0
" moonfly
let g:moonflyWinSeparator = 2

function! CheckHost(hostname)
	return match(system("echo -n $HOST"), a:hostname) >= 0
endfunction

if has('win32')
	let &shell='C:/Users/fedin/AppData/Local/Microsoft/WindowsApps/Microsoft.PowerShell_8wekyb3d8bbwe/pwsh.exe'
	let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	set shellquote= shellxquote=
	let &shellcmdflag='-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	" Theming
	colorscheme OceanicNext
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
else
	if CheckHost('sky.plumpalbert.xyz')
		colorscheme OceanicNext
	elseif CheckHost('archlinux')
		colorscheme gruvbox-material
	else
		colorscheme github_dark
	endif
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

set nowrap
set completeopt=menu,menuone,noselect
set title
set clipboard+=unnamed,unnamedplus
set cmdheight=1
set number relativenumber
set hidden
set mouse=a
set colorcolumn=80

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
set list listchars=tab:┇\ ,space:·,trail:■,eol:⤶,nbsp:␣
set showbreak=↪\
" Make cursor a line in insert
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Russian language
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

runtime autocmds.vim
runtime maps.vim
runtime menu_highlight.vim
lua require "init"
