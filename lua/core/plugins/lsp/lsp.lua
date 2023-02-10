return {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    { 'williamboman/mason-lspconfig.nvim',
        opts = {
            automatic_installation = true,
            ensure_installed = { 'sumneko_lua' }
        }
    },
    "folke/neodev.nvim",
    { 'jay-babu/mason-null-ls.nvim',
        dependencies = { 'williamboman/mason.nvim', }
    },
    { 'VonHeikemen/lsp-zero.nvim',
        event = 'BufEnter',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
          require "core.config.lsp"
        end
    },
}
