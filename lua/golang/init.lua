require "golang.lsp"

local M = {}

M.plugins = require "golang.plugins"

M.setup = function()
  require "core".setup(M.plugins)
end

return M
