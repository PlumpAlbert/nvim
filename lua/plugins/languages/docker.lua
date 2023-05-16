return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(opts.ensure_installed, { 'dockerls', "yamlls" }),
			}
		end,
	},
}
