return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('plumpvim-lsp-attach', { clear = true }),
        callback = function(event)
          local function map(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP] ' .. desc })
          end

          map('K', vim.lsp.buf.hover, 'Hover info')
          map('gd', vim.lsp.buf.definition, 'Hover info')
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

      require('mason-tool-installer').setup { ensure_installed = { 'stylua', 'lua_ls' } }

      require('mason-lspconfig').setup {
        handlers = {
          function(name)
            require('lspconfig')[name].setup {
              capabilities = capabilities,
            }
          end,
        },
      }
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.10.x',
    opts = {
      keymap = {
        preset = 'default',
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'snippets', 'buffer' },
      },
      completion = {
        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode == 'cmdline'
            end,
            auto_insert = function(ctx)
              return ctx.mode ~= 'cmdline'
            end,
          },
        },
        accept = {
          auto_brackets = { enabled = false },
        },
        menu = {
          enabled = true,
          min_width = 16,
          max_height = 8,
          border = 'none',
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label', gap = 1 },
            },
          },
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = false },
      },
    },
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[LSP] Format document',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}
