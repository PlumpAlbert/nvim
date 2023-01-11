return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "lewis6991/gitsigns.nvim",
  "stevearc/dressing.nvim",
  { "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require 'project_nvim'.setup {
        manual_mode = false,
        detection_methods = { 'pattern' },
        patterns = {
          ".git", "_darcs", ".hg", ".bzr", ".svn",
          "Makefile", "package.json", "vendor", ".venv",
          "node_modules"
        },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = true,
        silent_chdir = true,
        datapath = vim.fn.stdpath("data")
      }
    end
  },
  "nvim-lualine/lualine.nvim",
  { 'j-hui/fidget.nvim',
    lazy = false,
    config = function()
      require'fidget'.setup {}
    end
  },
  "romgrk/barbar.nvim",
  "goolord/alpha-nvim",
  { "norcalli/nvim-colorizer.lua",
    config = function()
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
      require 'colorizer'.setup {
        "*";
        css = defaults;
        html = defaults;
        sass = defaults;
      }
    end
  },
  { 'nvim-telescope/telescope.nvim', version = '0.1.x' },
  { "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = 'v2.x',
    dependecies = {
      'plenary',
      'nvim-web-devicons',
      'nui'
    }
  }
}
