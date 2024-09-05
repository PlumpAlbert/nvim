return {
	"navarasu/onedark.nvim",
	priority = 1000,
	lazy = false,
	config = true,
	opts = {
		transparent = true,
		term_colors = vim.o.termguicolors,
		ending_tildes = false,
		cmp_itemkind_reverse = false,

		code_style = {
			comments = "italic",
			keywords = "italic",
		},

		diagnostics = {
			darker = true,
			undercurl = true,
			background = true,
		},
	},
}
