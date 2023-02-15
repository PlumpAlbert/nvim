require "javascript.commands"
require "javascript.config.lsp"

local M = {}

M.plugins = require "javascript.plugins"

M.setup = function()
  require "core".setup(M.plugins)
end

return M
