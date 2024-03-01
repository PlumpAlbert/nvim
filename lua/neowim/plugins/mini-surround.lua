return {
	"echasnovski/mini.surround",
	version = "*",
	event = "VeryLazy",
	config = true,
	opts = {
		mappings = {
			add = "gza", -- Add surrounding in Normal and Visual modes
			delete = "gzd", -- Delete surrounding
			find = "gzf", -- Find surrounding (to the right)
			find_left = "gzF", -- Find surrounding (to the left)
			highlight = "gzh", -- Highlight surrounding
			replace = "gsr", -- Replace surrounding
			update_n_lines = "gzn", -- Update `n_lines`

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},
	},
}
