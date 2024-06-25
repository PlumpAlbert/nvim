local M = {
	"lewis6991/gitsigns.nvim",
	config = true,
	event = { "BufReadPre", "BufNewFile" },
}

M.keys = {
	-- next hunk
	{
		"]c",
		"<cmd>Gitsigns next_hunk<cr>",
		desc = "Jump to next hunk",
	},
	-- previous hunk
	{
		"[c",
		"<cmd>Gitsigns prev_hunk<cr>",
		desc = "Jump to previous hunk",
	},
	-- blame line
	{
		"<leader>gb",
		"<cmd>Gitsigns blame_line<cr>",
		desc = "Blame current line",
	},
	-- stage selection
	{
		mode = "v",
		"<leader>gs",
		":Gitsigns stage_hunk<cr>",
		desc = "Stage selection",
	},
	-- preview hunk (inline)
	{
		"<leader>gp",
		"<cmd>Gitsigns preview_hunk_inline<cr>",
		desc = "Preview hunk (inline)",
	},
	-- preview hunk
	{
		"<leader>gP",
		"<cmd>Gitsigns preview_hunk<cr>",
		desc = "Preview hunk",
	},
}

M.opts = {
	signcolumn = false,
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
		delay = 3000,
		ignore_whitespace = true,
	},
	current_line_blame_formatter = "<author>| <summary>",
	sign_priority = 10,
	update_debounce = 1000,
}

return M

