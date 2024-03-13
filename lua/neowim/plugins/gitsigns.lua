return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signcolumn = true,
		numhl = true,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			interval = 3000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 5000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <summary> (<author_time:%Y-%m-%d>)",
		sign_priority = 10,
		update_debounce = 1000,
	},
}
