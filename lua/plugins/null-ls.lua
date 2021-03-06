-- vim:ft=lua:ts=4:sw=0
local null_ls = require "null-ls"
local h = require "null-ls.helpers"
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local b = null_ls.builtins
local lsp = require "plugins.lsp.init"

local sources = {
    b.diagnostics.cspell.with {
        extra_args = { '--config', '~/.config/nvim/cspell.json' }
    },
    -- b.diagnostics.eslint_d,
    -- b.code_actions.eslint_d,
    -- prettier
    b.formatting.prettierd.with {
        env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.prettierrc')
        },
        filetypes = { "javascript", "javascriptreact", "typescript",
            "typescriptreact", "vue", "css", "scss", "less", "html",
            "json", "jsonc", "markdown", "graphql", "handlebars"
        }
    },
    -- Shell
    b.formatting.shfmt,
    -- Python
    b.formatting.autopep8.with {
        extra_args = {
            '--max-line-length', '80',
            '--experimental'
        }
    },
    -- PHP
    b.formatting.phpcbf.with {
        command = vim.fn.expand("~/.local/bin/phpcbf")
    },
    h.make_builtin {
        name = "blade_formatter",
        factory = h.formatter_factory,
        method = { methods.internal.FORMATTING },
        filetypes = { "blade" },
        generator_opts = {
            command = "blade-formatter",
            args = { "--stdin" },
            to_stdin = true
        },
        meta = {
            url = "https://github.com/shufo/blade-formatter",
            description = "An opinionated blade template formatter for Laravel that respects readability"
        },
    }
}


null_ls.setup {
    debug = false,
    sources = sources,

    -- format on save
    on_attach = function(client)
        lsp.on_attach(client)
    end,
}
