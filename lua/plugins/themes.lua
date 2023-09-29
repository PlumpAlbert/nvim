return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = true,
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
		},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = true,
		opts = {
			style = "night",
			light_style = "day",
			transparent = true,
			terminal_colors = true,
			sidebars = { "qf", "help", "lazy", "neo-tree" },
			hide_inactive_statusline = true,
		},
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = true,
		opts = {
			options = {
				compile_path = vim.fn.stdpath("cache") .. "/github-theme",
				compile_file_suffix = "_compiled",
				hide_end_of_buffer = true,
				transparent = true,
				terminal_colors = true,
				module_default = true,
				styles = {
					comments = "italic",
					keywords = "italic,bold",
					strings = "NONE",
				},
				inverse = {
					search = true,
					visual = false,
				},
			},
		},
	},
}
