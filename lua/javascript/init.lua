local M = {}

M.plugins = require "javascript.plugins"

M.setup = function()
    require "javascript.config.lsp"
end

return M
