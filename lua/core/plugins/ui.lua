return {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    { "onsails/lspkind.nvim", lazy = false },
    { "goolord/alpha-nvim",
        name = "alpha",
        event = "VimEnter",
        opts = function(_, opts)
          return vim.tbl_extend('force', require "core.config.alpha", opts)
        end
    },
    { "romgrk/barbar.nvim",
        event = "VimEnter",
        opts = function(_, opts)
          return vim.tbl_extend('force', require "core.config.barbar", opts)
        end
    },
    { "stevearc/dressing.nvim",
        event = "VimEnter",
        opts = function(_, opts)
          return vim.tbl_extend(
                  'force',
                  {
                      select = {
                          backend = { "nui", "telescope", "fzf_lua", "fzf", "builtin", }
                      }
                  },
                  opts
              )
        end
    },
    { "lewis6991/gitsigns.nvim",
        event = "VimEnter",
        opts = function(_, opts)
          return vim.tbl_extend('force', require 'core.config.gitsigns', opts)
        end,
        keys = {
            { '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>',    desc = 'Preview hunk',  mode = 'n', },
            { '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>',      desc = 'Stage hunk',    mode = { 'v', 'n' }, },
            { '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', desc = 'Undo staging',  mode = { 'v', 'n' }, },
            { '<leader>gv', '<cmd>Gitsigns select_hunk<CR>',     desc = 'Select hunk',   mode = 'n', },
            { ']c',         '<cmd>Gitsigns next_hunk<CR>',       desc = 'Next hunk',     mode = 'n', },
            { '[c',         '<cmd>Gitsigns prev_hunk<CR>',       desc = 'Previous hunk', mode = 'n', },
        }
    },
    { "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        opts = function(_, opts)
          return vim.tbl_extend('force', require 'core.config.lualine', opts)
        end
    },
    { "nvim-neo-tree/neo-tree.nvim",
        branch = 'v2.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        keys = {
            { "<leader>e", "<cmd>Neotree float toggle<CR>", desc = "Open file explorer" }
        },
        opts = function(_, opts)
          return vim.tbl_extend('force', require 'core.config.neotree', opts)
        end
    },
    { 'j-hui/fidget.nvim',
        event = "VimEnter",
        opts = function(_, opts)
          return vim.tbl_extend('force', {
                  window = { blend = 0, },
                  text = { spinner = 'earth' },
                  timer = { spinner_rate = 250 }
              }, opts)
        end
    },
    { "norcalli/nvim-colorizer.lua",
        event = "BufEnter",
        opts = function(_, opts)
          local defaults = {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              names = false, -- "Name" codes like Blue
              RRGGBBAA = false, -- #RRGGBBAA hex codes
              rgb_fn = false, -- CSS rgb() and rgba() functions
              hsl_fn = false, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
              -- Available modes: foreground, background
              mode = "background", -- Set the display mode.
          }
          return vim.tbl_extend('force', {
                  "*",
                  css = defaults,
                  html = defaults,
                  sass = defaults,
              }, opts)
        end
    },

}
