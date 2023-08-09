return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kdheepak/lazygit.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader><space>",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
					})
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
				desc = "Open buffer diagnostics",
			},
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
						layout_strategy = "horizontal",
						layout_config = {
							width = vim.o.columns,
							height = vim.o.lines,
							prompt_position = "bottom",
							preview_cutoff = 120,
							preview_width = 0.5,
						},
					},
				},
				defaults = {
					border = true,
					sorting_strategy = "ascending",
					selection_strategy = "closest",
					wrap_results = true,
					prompt_prefix = "🔭 ",
					find_command = {
						"rg",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_cursor({
							layout_config = {
								width = 64,
							},
						}),
					},
				},
			})
			-- load extensions
			require("telescope").load_extension("lazygit")
			require("telescope").load_extension("ui-select")
		end,
	},
}
