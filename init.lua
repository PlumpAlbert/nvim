vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
	tab = '-->',
	trail = '␣',
	nbsp = '␣',
	space = '·'
}

vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 3

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanked text',
	group = vim.api.nvim_create_augroup('plumpvim-highlight-yank', {clear=true}),
	callback = function()
		vim.highlight.on_yank()
	end
})
