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
	{
		"gd",
		function()
			require("telescope.builtin").lsp_definitions({
				jump_type = "vsplit",
				reuse_win = true,
			})
		end,
		desc = "Go to declaration",
	},
	{
		"gI",
		function()
			require("telescope.builtin").lsp_implementations({
				jump_type = "vsplit",
				reuse_win = true,
			})
		end,
		desc = "Go to implementation",
	},
	{
		"gr",
		function()
			require("telescope.builtin").lsp_references({
				jump_type = "vsplit",
			})
		end,
		desc = "Go to references",
	},
}

return M
