return {
  -- folke/lazydev.nvim
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- neovim/nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'folke/neoconf.nvim',
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'L3MON4D3/LuaSnip',
      'saghen/blink.cmp',
    },
    config = function()
      vim.diagnostic.config {
        virtual_lines = true,
        underline = false,
        float = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰃤',
            [vim.diagnostic.severity.WARN] = '󱈸',
            [vim.diagnostic.severity.INFO] = '󰙎',
            [vim.diagnostic.severity.HINT] = '',
          },
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('plumpvim-lsp-attach', { clear = true }),
        callback = function(event)
          local function map(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP] ' .. desc })
          end

          map('K', vim.lsp.buf.hover, 'Hover info')
          map('gd', vim.lsp.buf.definition, 'Hover info')
          map('<C-k>', vim.lsp.buf.signature_help, 'Signature help', 'i')
          map('<F2>', vim.lsp.buf.rename, 'Rename')
        end,
      })

      require('neoconf').setup {
        live_reload = false,
        filetype_jsonc = true,
        plugins = {
          lspconfig = { enabled = true },
          jsonls = {
            enabled = true,
            configured_servers_only = true,
          },
          lua_ls = {
            enabled_for_neovim_config = true,
            enabled = true,
          },
        },
      }

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
  -- saghen/blink.cmp
  {
    'saghen/blink.cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    version = 'v0.10.x',
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
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
        default = { 'lsp', 'snippets', 'buffer', 'path' },
      },
      completion = {
        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode ~= 'cmdline'
            end,
            auto_insert = function(ctx)
              return ctx.mode == 'cmdline'
            end,
          },
        },
        accept = {
          create_undo_point = true,
          auto_brackets = { enabled = false },
        },
        menu = {
          enabled = true,
          min_width = 16,
          max_height = 8,
          border = 'none',
          draw = {
            align_to = 'cursor',
            columns = {
              { 'kind_icon' },
              { 'label', gap = 1 },
            },
          },
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = false },
      },
      snippets = { preset = 'luasnip' },
    },
  },
  -- L3MON4D3/LuaSnip
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = 'v2.*',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load {}
      require('luasnip.loaders.from_vscode').load_standalone {
        lazy = true,
        path = '.vscode/project.code-snippets',
      }
    end,
  },
  -- stevearc/conform.nvim
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format {
            async = true,
            lsp_format = 'fallback',
          }
        end,
        mode = '',
        desc = '[LSP] Format document',
      },
    },
    opts = {
      notify_on_error = true,
      format_after_save = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
  -- Bekaboo/dropbar.nvim
  {
    'Bekaboo/dropbar.nvim',
    keys = function()
      local api = require 'dropbar.api'

      return {
        {
          '<leader>;',
          api.pick,
          desc = 'Pick symbols in winbar',
        },
        {
          '[;',
          api.goto_context_start,
          desc = 'Go to context start',
        },
        {
          '];',
          api.select_next_context,
          desc = 'Select next context',
        },
      }
    end,
  },
}
