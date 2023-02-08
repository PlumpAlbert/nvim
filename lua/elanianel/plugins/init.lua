local utils = require "core.lazy.util"
local M = {}

M = utils.concat(M, require "elanianel.plugins.debug")
M = utils.concat(M, require "elanianel.plugins.lsp")
M = utils.concat(M, require "elanianel.plugins.neovim")
M = utils.concat(M, require "elanianel.plugins.themes")

return M
