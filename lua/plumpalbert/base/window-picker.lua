return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	event = "VeryLazy",
	version = "2.*",
	config = true,
	opts = {
		hint = "statusline-winbar",
		picker_config = {
			statusline_winbar_picker = { use_winbar = "smart" },
		},
		filter_rules = {
			autoselect_one = true,
			include_current_win = false,
			bo = {
				filetype = { "neo-tree", "neo-tree-group", "notify" },
				buftype = { "terminal", "quickfix" },
			},
		},
	},
}
