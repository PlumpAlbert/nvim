return {
    { 'jose-elias-alvarez/null-ls.nvim',
        opts = function(_, opts)
            return vim.tbl_extend('force', opts, require "javascript.config.null")
        end
    },
}
