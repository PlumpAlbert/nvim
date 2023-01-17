-- vim:ft=lua:ts=4:sw=0:et
require 'mason-null-ls'.setup {
  ensure_installed = { 'prettier', 'eslint_d' }
}

local null_ls = require "null-ls"
local opts = require "lsp-zero".build_options('null-ls', {})
local b = null_ls.builtins

local prettier = nil
if vim.fn.has('win32') == 1 then
  prettier = b.formatting.prettier.with {
    extra_args = { '--config', vim.fn.expand('~/.prettierrc') },
    extra_filetypes = { 'scss', 'vue', 'json', 'markdown' }
  }
else
  prettier = b.formatting.prettierd.with {
    env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.prettierrc') },
    extra_filetypes = {
      "javascript", "javascriptreact", "typescript",
      "typescriptreact", "vue", "css", "scss", "less", "html",
      "json", "jsonc", "markdown", "graphql", "handlebars"
    }
  }
end

null_ls.setup {
  default_timeout = 10000,
  on_attach = opts.on_attach,
  sources = {
    b.diagnostics.eslint_d,
    b.code_actions.eslint_d,
    prettier,
    b.formatting.shfmt,
    b.formatting.autopep8.with {
      extra_args = {
        '--max-line-length', '80',
        '--experimental'
      }
    }
  }
}
