local M = {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	name = "git-worktree",
	event = "VeryLazy",
	config = function()
		require("telescope").load_extension("git_worktree")

		require("git-worktree").setup({
			update_on_change = true,
			clearjumps_on_change = true,
		})
	end,
	keys = {
		{ "<leader>gwl", "<cmd>Telescope git_worktree git_worktrees<cr>", desc = "List worktrees" },
		{ "<leader>gwa", "<cmd>Telescope git_worktree create_git_worktree<cr>", desc = "Create new worktree" },
	},
}

return M
