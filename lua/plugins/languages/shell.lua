return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed,
					{ "bashls" }
				),
				setup_handlers = opts.handlers,
			}
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed or {},
					{ "shfmt" }
				),
			}
		end,
	},
}
