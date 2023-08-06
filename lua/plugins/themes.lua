return {
	{
		"catppuccin/nvim",
		priority = 9999,
		name = "catppuccin",
		opts = {
			transparent_background = true,
			term_colors = true,
			compile = {
				enabled = true,
				path = vim.fn.stdpath("cache") .. "/catppuccin",
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			integrations = {
				gitsigns = true,
				mason = true,
				mini = true,
				neotree = true,
				cmp = true,
				treesitter = true,
				ts_rainbow2 = true,
				telescope = true,
				which_key = true,
			},
		},
		config = true,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 9999,
		config = true,
		opts = {
			undercurl = true,
			commentStyle = { italic = true },
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			background = {
				dark = "dragon",
				light = "lotus",
			},
		},
	},
	{
		"neanias/everforest-nvim",
		priority = 9999,
		name = "everforest",
		config = function()
			require("everforest").setup({
				background = "hard",
				disable_italic_comments = true,
				transparent_background_level = 2,
			})
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		priority = 9999,
		lazy = false,
		config = true,
		opts = {
			transparent = true,
			italic_comments = true,
		},
	},
	{
		"bluz71/vim-nightfly-colors",
		name = 'nightfly',
		priority = 1000,
		lazy = false,
		init = function()
			local g = vim.g

			g.nightflyCursorColor = true
			g.nightflyNormalFloat = false
			g.nightflyTransparent = true
			g.nightflyVirtualTextColor = true
			g.nightflyWinSeparator = 2
		end
	}
}
