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
	{ "<leader><space>", "<cmd>Telescope fd<cr>", desc = "Find file" },
}

return M
