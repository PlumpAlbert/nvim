local function capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    caps = cmp_nvim_lsp.default_capabilities(caps)
  end
  return caps
end

return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = { "nvim-dap-ui" },
    },
  },
  { "williamboman/mason.nvim", cmd = "Mason", opts = {}, cond = not vim.g.vscode },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    cond = not vim.g.vscode,
    config = function()
      require("mason").setup()
      vim.lsp.config("*", { capabilities = capabilities() })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {}, -- install servers manually via :Mason
        automatic_enable = true, -- enable installed servers with nvim-lspconfig defaults
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
          end

          vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          map("n", "<leader>de", vim.diagnostic.open_float, "Line diagnostics")
          map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "<leader>lF", function()
            vim.lsp.buf.format({ async = true })
          end, "Format with LSP")
        end,
      })
    end,
  },
}
