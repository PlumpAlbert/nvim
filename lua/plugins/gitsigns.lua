local M = {
	"lewis6991/gitsigns.nvim",
	config = true,
	event = "BufEnter",
	cmd = { "Gitsigns" },
	opts = {
		signcolumn = false,
		numhl = true,
		linehl = false,
		word_diff = false,
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_formatter = "<author> - <summary>",
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 750,
			ignore_whitespace = true,
			virt_text_priority = 1000,
		},
		preview_config = {
			style = "minimal",
			border = "solid",
			relative = "cursor",
			title = "Git hunk",
			title_pos = "center",
			row = -1,
			col = 1,
		},
	},
	keys = {
		{ "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview git hunk" },
		{ "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", mode = { "v", "n" }, desc = "Stage hunk" },
		{
			"<leader>gb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			mode = { "v", "n" },
			desc = "Stage hunk",
		},
		{ "]c", "<cmd>Gitsigns next_hunk<cr>" },
		{ "[c", "<cmd>Gitsigns prev_hunk<cr>" },
	},
}

return M
