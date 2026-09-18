vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use Neovim's built-in 0.13 directory browser instead of netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.remote")
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
