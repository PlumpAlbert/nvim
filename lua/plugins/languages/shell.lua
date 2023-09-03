return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			if vim.treesitter then
				vim.treesitter.language.register("bash", "zsh")
			end
			local M = require("config.servers.lsp")

			M.install[#M.install + 1] = "bashls"

			M.options = vim.tbl_extend("force", M.options, {
				bashls = {
					filetypes = { "bash", "sh", "zsh" },
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function()
			local null = require("null-ls")
			local M = require("config.servers.null")

			M.install[#M.install + 1] = "shfmt"
			vim.list_extend(M.sources, { null.builtins.formatting.shfmt })
		end,
	},
}
