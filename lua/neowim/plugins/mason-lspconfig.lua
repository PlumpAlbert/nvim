return {
	"williamboman/mason-lspconfig.nvim",
	config = function(_, opts)
		opts = opts or {}
		local ensure_installed = vim.list_extend({
			"lua_ls",
		}, opts.ensure_installed or {})

		local handlers = vim.tbl_extend("force", opts.handlers or {}, {
			require("lsp-zero").default_setup,
		})

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			handlers = handlers,
		})
	end,
}
