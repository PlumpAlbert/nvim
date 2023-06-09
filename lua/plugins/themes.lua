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
}
