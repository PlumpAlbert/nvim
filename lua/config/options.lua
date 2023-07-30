-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamed"
vim.opt.tabstop = 4

vim.opt.list = true
vim.opt.listchars = {
    tab = "󰄾  ",
    space = "·",
    trail = "-",
    eol = "",
    nbsp = "␣",
}

vim.opt.fillchars = {
    fold = " ",
    foldopen = "",
    foldsep = "│",
    foldclose = "",
}

vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 9999
vim.go.foldlevelstart = 9999
vim.wo.foldenable = true
vim.wo.colorcolumn = "81"

vim.opt.langmap =
    "ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"
