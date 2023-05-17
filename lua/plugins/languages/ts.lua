return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed or {},
					{ "tsserver", "cssls", "html", "emmet_ls" }
				),
			}
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed or {},
					{ "eslint", "prettier" }
				),
			}
		end,
	}
}
