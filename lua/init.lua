-- vim:ft=lua:ts=4:sw=0
local present, packer = pcall(require, 'packer_init')

if not present then
    return false
end

local use = packer.use

return packer.startup(function()
    use {
        "wbthomason/packer.nvim",
        event = "VimEnter"
    }
    use "nvim-lua/plenary.nvim"

    -- Snippet engine
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-cmdline",
            "f3fora/cmp-spell",
        },
        config = function() require "plugins.nvim-cmp" end
    }

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "onsails/lspkind-nvim",
            "williamboman/nvim-lsp-installer",
        },
        config = function() require "plugins.lspconfig" end
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        after = "plenary.nvim",
        config = function() require "plugins.null-ls" end,
    }
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function() require "plugins.treesitter" end,
    }
    use {
        "tami5/lspsaga.nvim",
        config = function() require "plugins.lspsaga" end,
    }
    use "RRethy/vim-illuminate"

    -- UI
    use {
        "kyazdani42/nvim-web-devicons",
        config = function() require "plugins.icons" end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function() require "plugins.colorizer" end,
    }
    use { "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            "arkav/lualine-lsp-progress"
        },
        config = function() require "plugins.lualine" end,
    }
    use { "kdheepak/tabline.nvim",
        config = function() require "plugins.tabline" end,
    }
    use {
        "akinsho/toggleterm.nvim",
        config = function() require "plugins.toggleterm" end,
    }
    use {
        "goolord/alpha-nvim",
        config = function()
            require('alpha').setup(require('alpha.themes.startify').config)
        end
    }

    -- UX
    use {
        "lewis6991/gitsigns.nvim",
        tag = "release",
        config = function() require "plugins.gitsigns" end,
    }
    use "lewis6991/impatient.nvim"
    use {
        "numToStr/Comment.nvim",
        module = "Comment",
        config = function() require("Comment").setup() end,
    }

    -- Navigation
    use {
        "kyazdani42/nvim-tree.lua",
        config = function() require "plugins.nvimtree" end,
    }
    use {
        "nvim-telescope/telescope.nvim",
        after = "plenary.nvim",
        config = function() require "plugins.telescope" end,
    }
    use { "nvim-telescope/telescope-fzf-native.nvim",
        run = 'make'
    }
    use { "ahmedkhalf/project.nvim",
        after = { "telescope.nvim" },
        config = function() require "plugins.project" end,
    }

    -- Productivity
    use "vim-scripts/auto-pairs-gentle"
    use "wakatime/vim-wakatime"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "sheerun/vim-polyglot"
    use "kkoomen/vim-doge"
    use "gpanders/editorconfig.nvim"
    use { "Pocco81/AutoSave.nvim",
        config = function() require "plugins.autosave" end,
    }

    -- Themes
    -- use "sainnhe/gruvbox-material"
    -- use "projekt0n/github-nvim-theme"
    -- use "mrkn/mrkn256.vim"
    -- use "bluz71/vim-moonfly-colors"
    use { "marko-cerovac/material.nvim",
        config = function()
            require('material').setup({
                contrast = {
                    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                    floating_windows = true, -- Enable contrast for floating windows
                    line_numbers = false, -- Enable contrast background for line numbers
                    sign_column = true, -- Enable contrast background for the sign column
                    cursor_line = false, -- Enable darker background for the cursor line
                    non_current_windows = false, -- Enable darker background for non-current windows
                    popup_menu = true, -- Enable lighter background for the popup menu
                },
                italics = {
                    comments = true, -- Enable italic comments
                    keywords = false, -- Enable italic keywords
                    functions = false, -- Enable italic functions
                    strings = false, -- Enable italic strings
                    variables = false -- Enable italic variables
                },
                contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
                    "terminal", -- Darker terminal background
                    "packer", -- Darker packer background
                    "qf", -- Darker qf list background
                    "NvimTree",
                },
                high_visibility = {
                    lighter = false, -- Enable higher contrast text for lighter style
                    darker = true -- Enable higher contrast text for darker style
                },
                disable = {
                    colored_cursor = false, -- Disable the colored cursor
                    borders = false, -- Disable borders between verticaly split windows
                    background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                    term_colors = false, -- Prevent the theme from setting terminal colors
                    eob_lines = true -- Hide the end-of-buffer lines
                },
                lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
                async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
                custom_highlights = {} -- Overwrite highlights with your own
            })
        end
    }
    use "tomasiser/vim-code-dark"
end)
