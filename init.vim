" vim:ft=vim:ts=4:sw=0
lua require"init"

syntax enable
let base16colorspace=256
set background=dark
let mapleader=' '

function! CheckHost(hostname)
	return match(system("echo -n $HOST"), a:hostname) >= 0
endfunction

if has('termguicolors')
	set termguicolors
endif


" indents
set tabstop=2
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
" set single statusbar
set laststatus=3
hi WinSeparator ctermfg=none guifg=none"

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
set list listchars=tab:\ ,space:·,trail:-,eol:﬋,nbsp:␣
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
lua require'impatient'

if CheckHost('plumpbook')
    colorscheme catppuccin
else
    colorscheme moonfly
endif
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
