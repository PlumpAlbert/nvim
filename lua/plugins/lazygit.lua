local M = {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>gg", "<cmd>LazyGitCurrentFile<cr>", desc = "Open lazygit" },
		{ "<leader>gl", "<cmd>LazyGitFilter<cr>", desc = "Open commit history" },
	},
	config = function()
		require("telescope").load_extension("lazygit")

		-- transparency of floating window
		vim.g.lazygit_floating_window_winblend = 0
		-- scaling factor for floating window
		vim.g.lazygit_floating_window_scaling_factor = 1
		-- customize lazygit popup window border characters
		vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		-- use plenary.nvim to manage floating window if available
		vim.g.lazygit_floating_window_use_plenary = 0
		-- fallback to 0 if neovim-remote is not installed
		vim.g.lazygit_use_neovim_remote = 0

		-- config file path is evaluated if this value is 1
		vim.g.lazygit_use_custom_config_file_path = 0
	end,
}

return M
