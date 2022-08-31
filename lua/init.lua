-- vim:ft=lua:ts=4:sw=0
local present, packer = pcall(require, 'packer_init')

if not present then
    return false
end

local use = packer.use

return packer.startup(function()
    use { "wbthomason/packer.nvim", }
    use "nvim-lua/plenary.nvim"

    -- Snippet engine
    use { "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "f3fora/cmp-spell",
        },
        config = function() require "plugins.nvim-cmp" end
    }

    -- LSP
    use { "neovim/nvim-lspconfig",
        requires = {
            "onsails/lspkind-nvim",
            "williamboman/nvim-lsp-installer",
        },
        config = function() require "plugins.lspconfig" end
    }
    use { "jose-elias-alvarez/null-ls.nvim",
        after = "plenary.nvim",
        config = function() require "plugins.null-ls" end,
    }
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use { "tami5/lspsaga.nvim",
        config = function() require "plugins.lspsaga" end,
    }
    use { "RRethy/vim-illuminate",
        config = function() require "plugins.illuminate" end
    }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-context",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "lewis6991/spellsitter.nvim"
        },
        config = function() require "plugins.treesitter" end,
    }

    -- UI
    use { "kyazdani42/nvim-web-devicons",
        config = function() require "plugins.icons" end,
    }
    use { "norcalli/nvim-colorizer.lua",
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
    use { "romgrk/barbar.nvim",
        config = function() require "plugins.barbar" end,
    }
    use { "akinsho/toggleterm.nvim",
        config = function() require "plugins.toggleterm" end,
    }
    use { "goolord/alpha-nvim",
        config = function() require "plugins.alpha" end
    }
    use { "anuvyklack/pretty-fold.nvim",
        config = function() require "plugins.pretty-fold" end
    }
    use { "rcarriga/nvim-notify",
        event = "VimEnter",
        config = function() require "plugins.notify" end,
    }

    -- UX
    use { "lewis6991/gitsigns.nvim",
        -- tag = "release",
        config = function() require "plugins.gitsigns" end,
    }
    use "lewis6991/impatient.nvim"
    use { "numToStr/Comment.nvim",
        module = "Comment",
        config = function() require("Comment").setup() end,
    }

    -- Navigation
    use { "kyazdani42/nvim-tree.lua",
        config = function() require "plugins.nvimtree" end,
    }
    use { "nvim-telescope/telescope.nvim",
        after = "plenary.nvim",
        config = function() require "plugins.telescope" end,
    }
    use { "nvim-telescope/telescope-fzf-native.nvim",
        run = 'make',
        disable = vim.fn.has('win32')
    }
    use { "ahmedkhalf/project.nvim",
        after = { "telescope.nvim" },
        config = function() require "plugins.project" end,
    }

    -- Productivity
    use "vim-scripts/auto-pairs-gentle"
    use "wakatime/vim-wakatime"
    use { "tpope/vim-surround",
        keys = { "c", "d", "y" },
        setup = function()
            vim.o.timeoutlen = 500
        end
    }
    use "sheerun/vim-polyglot"
    use "kkoomen/vim-doge"
    use "gpanders/editorconfig.nvim"
    use { "pocco81/auto-save.nvim",
        config = function() require "plugins.autosave" end,
    }

    -- Themes
    use { "bluz71/vim-moonfly-colors",
        config = function() require "plugins.themes.moonfly" end,
    }
    use "bluz71/vim-nightfly-guicolors"
    use { "Mofiqul/vscode.nvim",
        config = function() require "plugins.themes.vscode" end
    }
    use { "Mofiqul/dracula.nvim",
        config = function() require "plugins.themes.dracula" end
    }
    use { "catppuccin/nvim",
        as = 'catppuccin',
        config = function() require 'plugins.themes.catppuccin' end
    }
    use { "ellisonleao/gruvbox.nvim",
        config = function() require 'plugins.themes.gruvbox' end
    }
    use { "navarasu/onedark.nvim",
        config = function() require 'plugins.themes.onedark' end
    }
end)
