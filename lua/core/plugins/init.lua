local utils = require"core.lazy.util"
local M = {}

M = utils.concat(M, require "core.plugins.ui")
M = utils.concat(M, require "core.plugins.ux")
M = utils.concat(M, require "core.plugins.treesitter")

return M
