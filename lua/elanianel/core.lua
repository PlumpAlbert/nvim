vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.wrap = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 8
vim.opt.isfname:append('@-@')
vim.o.updatetime = 50

vim.o.signcolumn = 'yes'
vim.o.foldcolumn = '0'
vim.o.foldlevel = 9999
vim.o.foldlevelstart = 9999
vim.o.foldenable = true
vim.o.colorcolumn = '81'

vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.o.list = true
vim.opt.listchars = {
    tab = ' ';
    space = '·';
    trail = '-';
    eol = '﬋';
    nbsp = '␣'
}
vim.opt.fillchars = {
    fold = ' ',
    foldopen = '',
    foldsep = ' ',
    foldclose = ''
}
vim.o.showbreak = '↪'

vim.opt.langmap = "ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"

vim.g.mapleader = ' '
