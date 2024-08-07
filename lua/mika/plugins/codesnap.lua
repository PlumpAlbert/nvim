return {
	"mistricky/codesnap.nvim",
	enabled = vim.fn.has("unix") == 1,
	build = "make",
	config = true,
	keys = {
		{
			"<leader>s",
			"<cmd>CodeSnap<cr>",
		},
		{
			mode = "v",
			"<leader>s",
			":CodeSnap<cr>",
		},
	},
	opts = {
		has_breadcrumbs = true,
		show_workspace = true,
		-- breadcrumbs_separator = "👉",
		has_line_number = true,
		bg_theme = "grape",
		code_font_family = "Iosevka",
	},
}
