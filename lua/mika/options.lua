vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.relativenumber = true

vim.o.langmap =
	"ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"

vim.o.shiftround = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true

if vim.fn.has("termguicolors") then
	vim.o.termguicolors = true
end

if vim.fn.has("nvim-0.9.0") then
	vim.o.splitkeep = "screen"
	vim.opt.shortmess:append({
		a = true,
		C = true,
		W = true,
		c = true,
	})
end

vim.o.list = true
vim.opt.listchars = {
	tab = "-->",
	space = "·",
	trail = "-",
	-- eol = "",
	nbsp = "␣",
}

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "C:\\Windows\\System32\\cmd.exe"
end

vim.cmd("autocmd CmdlineEnter /,?,: :set hlsearch")
vim.cmd("autocmd CmdlineLeave /,?,: :set nohlsearch")

vim.o.foldcolumn = "1"
vim.o.foldmethod = "expr"
vim.o.foldlevelstart = 1
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
