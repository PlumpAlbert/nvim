local configPath = 'elanianel.config'
require(configPath .. ".dap")
require(configPath .. ".lsp")
require(configPath .. ".alpha")
require(configPath .. ".barbar")
require(configPath .. ".dressing")
require(configPath .. ".gitsigns")
require(configPath .. ".lualine")
require(configPath .. ".neotree")
require(configPath .. ".telescope")
require(configPath .. ".treesitter")

require 'mini.pairs'.setup {}
require 'mini.comment'.setup {}
require 'mini.surround'.setup {}
