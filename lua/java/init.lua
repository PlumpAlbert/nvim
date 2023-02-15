require "java.lsp"

local M = {}

M.plugins = require "java.plugins"

M.setup = function()
  require "core".setup(M.plugins)
end

return M
