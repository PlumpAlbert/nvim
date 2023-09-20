local M = {
	"nvim-telescope/telescope.nvim",
	event = "BufEnter",
	cmd = { "Telescope" },
}

M.opts = {
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
	},
}

M.keys = {
	{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find word" },
	{ "<leader>.", "<cmd>Telescope buffers<cr>", desc = "Find file" },
	{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find file" },
}

return M
