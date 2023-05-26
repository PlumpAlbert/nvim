return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed,
					{ "dockerls", "docker_compose_language_service" }
				),
				handlers = vim.tbl_extend("force", opts.setup_handlers or {}, {
					docker_compose_language_service = function()
						require("lspconfig").docker_compose_language_service.setup({
							capabilities = require("config.lsp").capabilities,
							filetypes = { "yaml.docker" },
						})
					end,
				}),
			}
		end,
	},
}
