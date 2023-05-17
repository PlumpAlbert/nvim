return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			"kdheepak/lazygit.nvim",
		},
		keys = {
			{
				"<leader><space>",
				function()
					require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Find files (Git)",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").git_files(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Find files (CWD)",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Live grep (project)",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Live grep (file)",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").resume(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Resume telescope",
			},
			{
				"<leader>,",
				function()
					require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))
				end,
				desc = "",
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("lazygit")
		end,
	},
}
