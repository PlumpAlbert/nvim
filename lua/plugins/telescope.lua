return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			"kdheepak/lazygit.nvim",
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader><space>",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files (Git)",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Find files (CWD)",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep (project)",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume telescope",
			},
			{
				"<leader>,",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Search buffers",
			},
			{
				"<leader>ld",
				function()
					require("telescope.builtin").diagnostics({ bufnr = 0 })
				end,
				desc = "",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					border = true,
					sorting_strategy = "ascending",
					layout_strategy = "vertical",
					layout_config = {
						height = 0.7,
						width = 0.5,
						preview_height = 0.2,
						prompt_position = "top",
					},
				},
			})
			require("telescope").load_extension("lazygit")
		end,
	},
}
