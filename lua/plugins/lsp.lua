return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        config = false,
        dependencies = {
            "kevinhwang91/promise-async",
            "neovim/nvim-lspconfig",
        },
        keys = function()
            local ok, ufo = pcall(require, "ufo")
            if not ok then
                return {}
            end
            return {
                {
                    "zM",
                    ufo.closeAllFolds,
                    desc = "Close all folds",
                },
                {
                    "zR",
                    ufo.openAllFolds,
                    desc = "Open all folds",
                },
                {
                    "zm",
                    ufo.closeFoldsWith,
                    desc = "Close fold",
                },
                {
                    "zr",
                    ufo.openFoldsExceptKinds,
                    desc = "Open folds, except kings",
                },
            }
        end,
    },

    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = { "b0o/schemastore.nvim" },
        init = function()
            require("ufo").setup()
        end,
        opts = function(_, opts)
            opts.servers = vim.tbl_extend("force", opts.servers, {
                jsonls = {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },
            })

            return opts
        end,
    },

    -- mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "eslint_d",
                "prettierd",
                "stylua",
                "cspell",
            },
        },
    },

    -- null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "davidmh/cspell.nvim" },
        opts = function()
            local cspell = require("cspell")
            local cspellConfig = {
                find_json = function()
                    return vim.fn.stdpath("config") .. "/cspell.json"
                end,
            }
            local nls = require("null-ls.builtins")
            return {
                root_dir = require("null-ls.utils").root_pattern(
                    ".null-ls-root",
                    ".neoconf.json",
                    "Makefile",
                    ".git"
                ),
                sources = {
                    nls.formatting.stylua,
                    nls.formatting.prettierd,
                    nls.code_actions.eslint_d,
                    nls.diagnostics.eslint_d,
                    cspell.diagnostics.with({ config = cspellConfig }),
                    cspell.code_actions.with({ config = cspellConfig }),
                },
            }
        end,
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")

            opts.mapping = cmp.mapping.preset.insert({
                ["<M-[>"] = cmp.mapping.scroll_docs(-4),
                ["<M-]>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-c>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true,
                }),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
            })

            return opts
        end,
    },
}
