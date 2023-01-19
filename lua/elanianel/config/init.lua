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
require 'mini.surround'.setup {
  mappings = {
    add = '', -- Add surrounding in Normal and Visual modes
    delete = '', -- Delete surrounding
    find = '', -- Find surrounding (to the right)
    find_left = '', -- Find surrounding (to the left)
    highlight = '', -- Highlight surrounding
    replace = '', -- Replace surrounding
    update_n_lines = '', -- Update `n_lines`
    suffix_last = '', -- Suffix to search with "prev" method
    suffix_next = '', -- Suffix to search with "next" method
  },
}
