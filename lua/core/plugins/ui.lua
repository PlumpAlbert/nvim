return {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "onsails/lspkind.nvim",
    { "goolord/alpha-nvim",
        name = "alpha",
        opts = function(_, opts)
          return vim.tbl_extend('force', require "core.config.alpha", opts)
        end
    },
    { "romgrk/barbar.nvim",
        opts = function(_, opts)
          return vim.tbl_extend('force', require "core.config.barbar", opts)
        end
    },
    { "stevearc/dressing.nvim",
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
        opts = function(_, opts)
          return vim.tbl_extend('force', require 'core.config.gitsigns', opts)
        end
    },
    { "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
          return vim.tbl_extend('force', require 'core.config.lualine', opts)
        end
    },
    { "nvim-neo-tree/neo-tree.nvim",
        branch = 'v2.x',
        dependecies = {
            'plenary',
            'nvim-web-devicons',
            'nui'
        },
        keys = {
            { "<leader>e", "<cmd>Neotree float toggle<CR>", desc = "Open file explorer" }
        },
        opts = function(_, opts)
          return vim.tbl_extend('force', require 'core.config.neotree', opts)
        end
    },
    "MunifTanjim/nui.nvim",
    { 'j-hui/fidget.nvim',
        lazy = false,
        opts = function(_, opts)
          return vim.tbl_extend('force', {
                  window = { blend = 0, },
                  text = { spinner = 'earth' },
                  timer = { spinner_rate = 250 }
              }, opts)
        end
    },
    { "norcalli/nvim-colorizer.lua",
        lazy = false,
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
