return {
	"echasnovski/mini.comment",
	version = "*",
	event = "VeryLazy",
	config = true,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	opts = {
		custom_commentstring = function()
			return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
		end,
		mappings = {
			comment = "gc",
			comment_line = "gcc",
			textobject = "gc",
		},
	},
}
