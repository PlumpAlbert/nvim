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
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-omni"
	use "hrsh7th/cmp-cmdline"
	use {
		"hrsh7th/nvim-cmp",
		config = function() require "plugins.nvim-cmp" end
	}

	-- LSP
	use {
		"neovim/nvim-lspconfig",
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
	use "lervag/vimtex"

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
	use {"nvim-lualine/lualine.nvim",
		after = "github-nvim-theme",
		config = function() require "plugins.lualine" end,
	}
	use "onsails/lspkind-nvim"

	-- UX
	use {
		"lewis6991/gitsigns.nvim",
		tag = "release",
		config = function() require "plugins.gitsigns" end,
	}
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
	use {"nvim-telescope/telescope-fzf-native.nvim",
		run = 'make'
	}
	use {"ahmedkhalf/project.nvim",
		after = { "telescope.nvim" },
		config = function() require "plugins.project" end,
	}

	-- Productivity
	use "wakatime/vim-wakatime"
	use "tpope/vim-surround"
	use "tpope/vim-fugitive"
	use "sheerun/vim-polyglot"
	use "kkoomen/vim-doge"
	use "gpanders/editorconfig.nvim"
	use {"Pocco81/AutoSave.nvim",
		config = function() require "plugins.autosave" end,
	}

	-- Themes
	use "sainnhe/everforest"
	use "danilo-augusto/vim-afterglow"
	use "arcticicestudio/nord-vim"
	use "dracula/vim"
	use "mhartington/oceanic-next"
	use "sainnhe/gruvbox-material"
	use "projekt0n/github-nvim-theme"
	use "overcache/NeoSolarized"
	use "mrkn/mrkn256.vim"
	use "nekonako/xresources-nvim"
	use "bluz71/vim-moonfly-colors"
end)
