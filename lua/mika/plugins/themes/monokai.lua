return {
	"loctvl842/monokai-pro.nvim",
	config = true,
	lazy = false,
	priority = 1000,
	opts = {
		terminal_colors = true,
		devicons = true,
		filter = "pro",
		styles = {
			comment = { italic = true },
		},
		inc_search = "underline",
		background_clear = {
			"float_win",
			"notify",
			"neo-tree",
		},
	},
}
