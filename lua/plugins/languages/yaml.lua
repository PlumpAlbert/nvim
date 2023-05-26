return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed,
					{ "yamlls" }
				),
				handlers = vim.tbl_extend("force", opts.setup_handlers or {}, {
					docker_compose_language_service = function()
						require("lspconfig").yamlls.setup({
							capabilities = require("config.lsp").capabilities,
							settings = {
								yaml = {
									validate = false,
									format = {
										enable = true,
										singleQuote = false,
										bracketSpacing = true,
										proseWrap = "Preserve",
										printWidth = 80,
									},
								},
							},
						})
					end,
				}),
			}
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			return {
				ensure_installed = vim.list_extend(
					opts.ensure_installed or {},
					{ "yamllint" }
				),
			}
		end,
	},
}
