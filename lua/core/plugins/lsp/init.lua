local utils = require "core.lazy.util"
local M = {}

M = utils.concat(M, require "core.plugins.lsp.completion")
M = utils.concat(M, require "core.plugins.lsp.lsp")
M = utils.concat(M, require "core.plugins.lsp.null")
M = utils.concat(M, require "core.plugins.lsp.snippets")

return M
