return {
    {
        'jay-babu/mason-null-ls.nvim',
        ---@type MasonNullLsSettings
        opts = {
            ensure_installed = {
                'prettierd',
                'eslint_d'
            }
        }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local b = require("null-ls.builtins")

            opts.sources = vim.list_extend(opts.sources, {
                b.diagnostics.eslint_d,
                b.code_actions.eslint_d,
                b.formatting.prettierd.with({
                    env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.prettierrc") },
                    extra_filetypes = {
                        "vue",
                        "json",
                        "scss",
                        "markdown",
                    },
                }),
            })

            return opts
        end,
    },
}
