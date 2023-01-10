local configPath = 'elanianel.config'
require(configPath .. ".lsp")
require(configPath .. ".neotree")
require(configPath .. ".gitsigns")
require(configPath .. ".dressing")

require 'mini.pairs'.setup {}
require 'mini.comment'.setup {}
require 'mini.surround'.setup {}
