local M = {}

M.plugins = require "java.plugins"

M.setup = function()
    require "java.lsp"
end

return M
