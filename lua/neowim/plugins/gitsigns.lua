return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "n", "]c", "<cmd>Gitsigns next_hunk<cr>", desc = "Jump to next hunk" },
		{ "n", "[c", "<cmd>Gitsigns prev_hunk<cr>", desc = "Jump to previous hunk" },
		{ "n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame current line" },
		{ "n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage selection" },
		{ "s", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk (inline)" },
		{ "s", "<leader>gP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
	},
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
