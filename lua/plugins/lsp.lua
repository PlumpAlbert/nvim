return {
    --#region Mason
    {
        "williamboman/mason.nvim",
        keys = {
            { '<leader>lm', '<cmd>Mason<cr>', desc = 'Open Mason' },
        },
        opts = {
            ensure_installed = { "lua-language-server", "stylua" },
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim" },
    },
    --#endregion

    --#region Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("_core.lsp.completion")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({})
        end,
    },
    --#endregion

    --#region LSP
    {
        'neovim/nvim-lspconfig',
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()

            -- disable default keys
            keys[#keys + 1] = { "<leader>cd", false }
            keys[#keys + 1] = { "<leader>ca", false, mode = { 'n', 'v' } }
            keys[#keys + 1] = { "<leader>cf", false }
            keys[#keys + 1] = { "<leader>cr", false }
            keys[#keys + 1] = { "<leader>cl", false }


            keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = 'Rename symbol' }
            keys[#keys + 1] = { "<leader>la", vim.lsp.buf.code_action, desc = 'Code actions' }
            keys[#keys + 1] = {
                "<leader>lf",
                require("lazyvim.plugins.lsp.format").format,
                desc = 'Format document',
                has = 'documentFormatting'
            }
            keys[#keys + 1] = {
                "<leader>lf",
                require("lazyvim.plugins.lsp.format").format,
                desc = 'Format document',
                has = 'documentRangeFormatting',
                mode = 'v'
            }
        end
    },
    --#endregion

    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "neovim/nvim-lspconfig", "kevinhwang91/promise-async" },
        config = true,
    },
}
