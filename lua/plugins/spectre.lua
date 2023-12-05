local M = {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	opts = {
		is_block_ui_break = true,
		color_devicons = false,
		live_update = false,
	},
}

M.keys = {
	{
		"<leader>S",
		function()
			require("spectre").toggle()
		end,
		desc = "Find & Replace",
	},
	{
		"<leader>rw",
		function()
			require("spectre").open_visual({
				select_word = true,
			})
		end,
		desc = "Replace current word",
		mode = { "n", "v" },
	},
	{
		"<leader>rb",
		function()
			require("spectre").open_file_search({
				select_word = true,
			})
		end,
		desc = "Replace (current buffer)",
		mode = { "n", "v" },
	},
}

return M
