return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			local lsp = require("config.servers.lsp")

			vim.list_extend(lsp.install, { "ansiblels" })
			lsp.options = vim.tbl_extend("force", lsp.options, {
				ansiblels = {
					filetypes = { "yaml.ansible" },
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function()
			local null = require("null-ls")
			local M = require("config.servers.null")

			M.install[#M.install + 1] = "ansiblelint"
			M.sources[#M.sources + 1] = null.builtins.diagnostics.ansiblelint
		end,
	},
}
