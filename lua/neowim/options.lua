vim.g.mapleader = " "

vim.opt.langmap =
"ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.showbreak = "<-->"
vim.opt.wrap = false

vim.opt.formatoptions = 'jcroqlnt'
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.smartindent = true

vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true

if vim.fn.has('termguicolors') then
	vim.opt.termguicolors = true
end

if vim.fn.has('nvim-0.9.0') then
	vim.opt.splitkeep = "screen"
	vim.opt.shortmess:append({
		C = true,
		W = true,
		a = true,
		I = true,
		c = true
	})
end

vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200

vim.cmd("autocmd CmdlineEnter /,? :set hlsearch")
vim.cmd("autocmd CmdlineLeave /,? :set nohlsearch")

vim.opt.guifont = {
	"Iosevka:h12",
}

