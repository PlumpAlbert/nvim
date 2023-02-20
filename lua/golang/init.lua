local M = {}

M.plugins = require "golang.plugins"

M.setup = function()
    require "golang.lsp"
end

return M
