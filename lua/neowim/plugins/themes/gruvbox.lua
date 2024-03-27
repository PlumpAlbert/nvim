return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	enabled = false,
	config = function()
		-- Default options:
		require("gruvbox").setup({
			terminal_colors = vim.o.termguicolors, -- add neovim terminal colors
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
			invert_tabline = true,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			dim_inactive = false,
			transparent_mode = false,
		})

		vim.cmd("colorscheme gruvbox")
	end,
}
