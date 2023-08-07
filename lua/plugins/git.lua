return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
			numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = {
				enable = false,
			},
		},
		keys = {
			{
				"<leader>ghp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Preview hunk",
			},
			{
				"<leader>ghr",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Reset hunk",
			},
			{
				"<leader>ghs",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "Stage hunk",
			},
			{
				"<leader>ghu",
				function()
					require("gitsigns").undo_stage_hunk()
				end,
				desc = "Undo stage hunk",
			},
			{
				"[c",
				function()
					require("gitsigns").prev_hunk()
				end,
				desc = "Go to previous hunk",
			},
			{
				"]c",
				function()
					require("gitsigns").next_hunk()
				end,
				desc = "Go to next hunk",
			},
			{
				"<leader>gb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "Preview hunk",
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
	},
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{
				"<leader>gg",
				"<cmd>LazyGit<cr>",
				desc = "Open LazyGit",
				silent = true,
			},
			{
				"<leader>gc",
				"<cmd>LazyGitConfig<cr>",
				desc = "Edit LazyGit configuration",
				silent = true,
			},
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
			vim.g.lazygit_floating_window_use_plenary = true
			vim.g.lazygit_use_custom_config_file_path = false
		end,
	},
}
