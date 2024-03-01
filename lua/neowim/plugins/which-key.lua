return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function(_, opts)
		require("which-key").setup(opts or {})
	end,
}
