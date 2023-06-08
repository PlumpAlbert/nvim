return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			local M = require("config.servers.lsp")

			M.install[#M.install + 1] = "tsserver"
			M.install[#M.install + 1] = "cssls"
			M.install[#M.install + 1] = "html"
			M.install[#M.install + 1] = "emmet_ls"
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function()
			local null = require("null-ls")
			local M = require("config.servers.null")

			M.install[#M.install + 1] = "eslint_d"
			M.install[#M.install + 1] = "prettier"

			vim.list_extend(M.sources, {
				null.builtins.formatting.prettier,
				null.builtins.diagnostics.eslint_d,
				null.builtins.code_actions.eslint_d,
			})
		end,
	},
}
