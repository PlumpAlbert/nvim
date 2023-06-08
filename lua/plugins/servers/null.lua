return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		lazy = false,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = "BufEnter",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local M = require("config.servers.null")

			print("null-ls")
			-- print(vim.inspect(M.sources))
			require("null-ls").setup({
				sources = M.sources,
			})
			require("mason-null-ls").setup({
				automatic_setup = true,
				automatic_installation = true,
				ensure_installed = require("config.servers.null").install,
			})
		end,
	},
}
