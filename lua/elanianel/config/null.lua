local b = require "null-ls".builtins

return {
    default_timeout = 10000,
    sources = {
        b.diagnostics.eslint_d,
        b.code_actions.eslint_d,
        b.formatting.prettierd.with {
            env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.prettierrc') },
            extra_filetypes = {
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "vue", "css", "scss", "less", "html",
                "json", "jsonc", "markdown", "graphql", "handlebars"
            }
        }
    }
}
