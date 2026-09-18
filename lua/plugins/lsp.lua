local servers = {
  "bashls",
  "cssls",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "ts_ls",
  "yamlls",
}

local function capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then
    caps = cmp_nvim_lsp.default_capabilities(caps)
  end
  return caps
end

local function server_opts(server)
  local opts = {
    capabilities = capabilities(),
  }

  if server == "lua_ls" then
    opts.settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
      },
    }
  end

  return opts
end

return {
  { "williamboman/mason.nvim", cmd = "Mason", opts = {} },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = false, -- configs are enabled explicitly via vim.lsp.config/enable below
      })

      for _, server in ipairs(servers) do
        if vim.lsp.config and vim.lsp.enable then
          vim.lsp.config(server, server_opts(server))
          vim.lsp.enable(server)
        else
          require("lspconfig")[server].setup(server_opts(server))
        end
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
          end

          vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gr", "<cmd>FzfLua lsp_references<cr>", "References")
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
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
