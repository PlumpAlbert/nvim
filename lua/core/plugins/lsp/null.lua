return {
    { 'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'VonHeikemen/lsp-zero.nvim' },
        opts = function(_, opts)
          return vim.tbl_extend(
                  'force',
                  require "lsp-zero".build_options('null-ls', {}),
                  opts
              )
        end
    },
    'kevinhwang91/promise-async',
    { 'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' }
    },
    { 'jay-babu/mason-null-ls.nvim',
        dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
            'williamboman/mason.nvim',
        },
        opts = function(_, opts)
          return vim.tbl_extend(
                  'force',
                  { ensure_installed = { 'prettierd', 'eslint_d' } },
                  opts
              )
        end
    },
}
