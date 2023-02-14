return {
    { 'jose-elias-alvarez/null-ls.nvim',
        opts = function(_, opts)
          return vim.tbl_extend('force', opts, {
                  sources = {
                      require "null-ls".builtins.formatting.google_java_format
                  }
              })
        end
    },
    { "mfussenegger/nvim-jdtls" }
}
