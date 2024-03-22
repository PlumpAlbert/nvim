return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		opts = opts or {}
		local ensure_installed = vim.list_extend({
			"lua_ls",
		}, opts.ensure_installed or {})

		local handlers = vim.tbl_extend("force", opts.handlers or {}, {
			require("lsp-zero").default_setup,
			lua_ls = function(...)
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							workspace = {
								library = { vim.env.VIMRUNTIME },
							},
						},
					},
				})
			end,
		})

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			handlers = handlers,
		})
	end,
}
