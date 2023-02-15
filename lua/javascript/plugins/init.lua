local utils = require "core.lazy.util"

local M = {
    { 'jose-elias-alvarez/null-ls.nvim',
        opts = function(_, opts)
          return vim.tbl_extend('force', opts, require "javascript.config.null")
        end
    },
}

M = utils.concat(M, require "javascript.plugins.themes")

return M
