vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use neo-tree instead of the built-in directory browsers.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_nvim_dir_plugin = true

require("config.remote")
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
