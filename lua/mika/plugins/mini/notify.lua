return {
	"echasnovski/mini.notify",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.notify").setup({
			lsp_progress = {
				enable = true,
				duration_last = 1000,
			},
			window = {
				config = function()
					return {
						col = 2,
						row = vim.o.lines - 6,
					}
				end,
				max_width_share = 0.7,
				winblend = 0,
			},
		})

		vim.notify = require("mini.notify").make_notify()
	end,
}

