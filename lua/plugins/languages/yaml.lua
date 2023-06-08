return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			local M = require("config.servers.lsp")

			M.install[#M.install + 1] = "yamlls"
			M.options = vim.tbl_extend("force", M.options, {
				yamlls = {
					settings = {
						yaml = {
							validate = false,
							format = {
								enable = true,
								singleQuote = false,
								bracketSpacing = true,
								proseWrap = "preserve",
								printWidth = 80,
							},
						},
					},
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function()
			local null = require("null-ls")
			local M = require("config.servers.null")

			M.install[#M.install + 1] = "yamllint"
			vim.list_extend(M.sources, {
				null.builtins.diagnostics.yamllint,
			})
		end,
	},
}
