return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>gg",
			"<cmd>LazyGit<cr>",
			desc = "LazyGit",
		},
	},
	init = function()
		vim.g.lazygit_floating_window_winblend = 0
		vim.g.lazygit_floating_window_scaling_factor = 1
		vim.g.lazygit_floating_window_use_plenary = 1
	end,
}
