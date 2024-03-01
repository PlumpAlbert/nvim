return {
	"williamboman/mason-lspconfig.nvim",
	config = function(_, opts)
		opts = opts or {}
		local ensure_installed = vim.list_extend({
			"lua_ls",
		}, opts.ensure_installed or {})

		local handlers = vim.tbl_extend("force", {
			require("lsp-zero").default_setup,
		}, opts.handlers or {})

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
		})
	end,
}
