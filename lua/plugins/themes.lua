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
		"Mofiqul/vscode.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = true,
		},
		config = true,
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
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		},
	},
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		config = true,
		opts = {
			transparent_background = true,
			terminal_colors = true,
			devicons = true,
			filter = "pro",
			inc_search = "underline",
			background_clear = {
				"float_win",
				"telescope",
				"which-key",
				"neo-tree",
			},
		},
	},
}
