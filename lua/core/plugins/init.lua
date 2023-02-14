local utils = require"core.lazy.util"
local M = {}

M = utils.concat(M, require "core.plugins.themes")
M = utils.concat(M, require "core.plugins.lsp")
M = utils.concat(M, require "core.plugins.ui")
M = utils.concat(M, require "core.plugins.ux")
M = utils.concat(M, require "core.plugins.telescope")
M = utils.concat(M, require "core.plugins.treesitter")
M = utils.concat(M, require "core.plugins.dap")

return M
