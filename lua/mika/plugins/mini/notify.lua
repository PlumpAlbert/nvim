return {
	"echasnovski/mini.notify",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.notify").setup({
			lsp_progress = {
				enable = true,
				duration_last = 500,
			},
			window = {
				config = function()
					return { anchor = "SE" }
				end,
				max_width_share = 0.382,
				winblend = 25,
			},
		})

		vim.notify = require("mini.notify").make_notify()
	end,
}
