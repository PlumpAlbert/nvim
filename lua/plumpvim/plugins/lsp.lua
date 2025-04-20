---@type vim.diagnostic.Opts
local diagnostic_config = {
  virtual_lines = { current_line = true },
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
      'b0o/schemastore.nvim',
    },
    keys = {
      {
        '<leader>d',
        function()
          local current = vim.diagnostic.config()
          if current ~= nil and (current.virtual_lines ~= nil and current.virtual_lines ~= false) then
            vim.diagnostic.config( --
              vim.tbl_deep_extend(
                'force', --
                current,
                {
                  virtual_lines = false,
                }
              )
            )
          else
            vim.diagnostic.config(diagnostic_config)
          end
        end,
        desc = '[LSP] Toggle diagnostics',
      },
    },
    config = function()
      vim.diagnostic.config(diagnostic_config)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('plumpvim-lsp-attach', { clear = true }),
        callback = function(event)
          local function map(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP] ' .. desc })
          end

          map('K', function()
            vim.lsp.buf.hover {
              border = 'single',
            }
          end, 'Hover info')
          map('gd', vim.lsp.buf.definition, 'Hover info')
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

      local function default_handler(name, opts)
        require('lspconfig')[name].setup(vim.tbl_extend('keep', {
          capabilities = capabilities,
        }, opts))
      end

      require('mason-lspconfig').setup {
        handlers = {
          function(name)
            default_handler(name, {})
          end,

          jsonls = function()
            default_handler('jsonls', {
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
            })
          end,

          yamlls = function()
            default_handler('yamlls', {
              settings = {
                yaml = {
                  schemaStore = {
                    enable = false,
                    url = '',
                  },
                  schemas = require('schemastore').yaml.schemas(),
                },
              },
            })
          end,
        },
      }
    end,
  },
  -- saghen/blink.cmp
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'milanglacier/minuet-ai.nvim',
    },
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        ['<C-i>'] = require('minuet').make_blink_map(),
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'snippets', 'buffer', 'path', 'minuet' },
        providers = {
          minuet = {
            name = 'minuet',
            module = 'minuet.blink',
            score_offset = 8,
          },
        },
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
        trigger = {
          prefetch_on_insert = false,
        },
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
    event = 'BufEnter',
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format {
            async = true,
            lsp_format = 'fallback',
            stop_after_first = false,
          }
        end,
        desc = '[LSP] Format document',
      },
    },
    config = function()
      require('conform').setup {
        log_level = vim.log.levels.DEBUG,
        notify_on_error = true,
        default_format_opts = {
          lsp_format = 'fallback',
          stop_after_first = true,
          timeout_ms = 5000,
        },
        format_after_save = {},
        formatters_by_ft = {
          lua = { 'stylua' },
        },
      }
    end,
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
