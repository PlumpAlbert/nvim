vim.o.langmap =
	"ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.tabstop = 4
vim.o.shiftwidth = 0

if vim.fn.has('termguicolors') then
	vim.o.termguicolors = true
end

if vim.fn.has('nvim-0.9.0') then
	vim.o.splitkeep = 'screen'
	vim.opt.shortmess:append({
			a = true,
			C = true,
			W = true,
			c = true,
	})
end

vim.o.list = true
vim.opt.listchars = {
    tab = '-->',
	space = "·",
	trail = "-",
	-- eol = "",
	nbsp = "␣",
}

vim.o.foldcolumn = "1"
vim.o.foldmethod = "expr"
vim.o.foldlevelstart = 1
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
