local utils = require "core.lazy.util"

local M = {
    "folke/which-key.nvim",
    { 'jose-elias-alvarez/null-ls.nvim',
        opts = function(_, opts)
          return vim.tbl_extend('force', opts, require "elanianel.config.null")
        end
    },
}

M = utils.concat(M, require "elanianel.plugins.themes")


return M
